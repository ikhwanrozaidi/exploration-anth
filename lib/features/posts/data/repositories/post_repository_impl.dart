import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/core/network/network_info.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostLocalDataSource _localDataSource;
  final PostRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PostRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._networkInfo,
  ) {
    print('------PostRepositoryImpl constructor called');
  }

  //
  //
  //
  ////-----Core function of GET posts
  @override
  Future<Either<Failure, List<Post>>> getPosts({
    bool forceRefresh = false,
  }) async {
    // Check network connectivity
    final startConnectivityCheck = DateTime.now();
    final isConnected = await _networkInfo.isConnected;
    final connectivityCheckTime = DateTime.now()
        .difference(startConnectivityCheck)
        .inMilliseconds;

    print(
      'PostRepositoryImpl.getPosts: Network connectivity check completed in ${connectivityCheckTime}ms. Connected: $isConnected',
    );

    if (isConnected && forceRefresh) {
      //Fetch Online
      return await _getPostsFromRemoteAndCache();
    } else if (isConnected) {
      // Try local first, then remote
      final localPosts = await _localDataSource.getAllPosts();

      if (localPosts.isNotEmpty) {
        //Try to fetch local Post
        return Right(localPosts);
      } else {
        //Not found any local Post, try fetch remote
        return await _getPostsFromRemoteAndCache();
      }
    } else {
      // Offline - return local data
      final localPosts = await _localDataSource.getAllPosts();
      if (localPosts.isNotEmpty) {
        //Return data from local database
        return Right(localPosts);
      } else {
        //No data from local Database
        return const Left(ConnectionFailure());
      }
    }
  }

  //Fetch Online from getPosts
  Future<Either<Failure, List<Post>>> _getPostsFromRemoteAndCache() async {
    print('------PostRepositoryImpl._getPostsFromRemoteAndCache called');

    final remoteResult = await _remoteDataSource.getPosts();

    return remoteResult.fold(
      (failure) {
        // If remote fails, try to return local data
        return _getLocalPostsAsFallback();
      },
      (remotePosts) async {
        // Success fetching online. Then store it in local db
        try {
          //clear the db and insert new one
          await _localDataSource.clearAllPosts();
          await _localDataSource.insertPosts(remotePosts);
        } catch (e) {
          //fail to save to db. then what? haha
        }

        return Right(remotePosts);
      },
    );
  }

  //Return local data from _getPostsFromRemoteAndCache
  Future<Either<Failure, List<Post>>> _getLocalPostsAsFallback() async {
    print('------PostRepositoryImpl._getLocalPostsAsFallback called');

    //get the localData from db
    final localPosts = await _localDataSource.getAllPosts();

    if (localPosts.isNotEmpty) {
      //returning local data
      return Right(localPosts);
    } else {
      //no local db
      return const Left(
        ServerFailure('Failed to fetch posts and no local data available'),
      );
    }
  }

  //
  //
  //
  ////-----Core function of POST posts
  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    print('------PostRepositoryImpl.createPost called for: ${post.title}');

    // Check network connectivity
    final isConnected = await _networkInfo.isConnected;

    if (isConnected) {
      // Try to create remotely first
      final remoteResult = await _remoteDataSource.createPost(post);

      return remoteResult.fold(
        (failure) async {
          // Fail to create Online, store locally for later sync
          final localPost = await _localDataSource.insertPost(post);
          return Right(localPost);
        },
        (remotePost) async {
          // Remote success then store to local db
          try {
            final syncedPost = remotePost.copyWith(isSynced: true);
            await _localDataSource.insertPost(syncedPost);
          } catch (e) {
            //fail to store locally
          }

          return Right(remotePost);
        },
      );
    } else {
      // Offline - store locally for later sync
      final localPost = await _localDataSource.insertPost(post);
      return Right(localPost);
    }
  }

  //
  //
  //
  ////-----Core function of GET local post
  @override
  Future<Either<Failure, List<Post>>> getLocalPosts() async {
    print('------PostRepositoryImpl.getLocalPosts called');

    try {
      // Fetch from local db
      final localPosts = await _localDataSource.getAllPosts();
      return Right(localPosts);
    } catch (e) {
      // Fail to fetch from local db
      return Left(CacheFailure('Failed to fetch local posts: ${e.toString()}'));
    }
  }

  //
  //
  //
  ////-----Core function of SYNC post
  @override
  Future<Either<Failure, void>> syncPosts() async {
    print('------PostRepositoryImpl.syncPosts called');

    // Check network connectivity
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      // No Internet Connection
      return const Left(ConnectionFailure());
    }

    try {
      // Get unsynced posts
      final unsyncedPosts = await _localDataSource.getUnsyncedPosts();

      for (final post in unsyncedPosts) {
        print(
          '------PostRepositoryImpl.syncPosts: Syncing post: ${post.title}',
        );

        final result = await _remoteDataSource.createPost(post);
        result.fold(
          (failure) => print(
            'PostRepositoryImpl.syncPosts: Failed to sync post ${post.id}: ${failure.message}',
          ),
          (syncedPost) async {
            await _localDataSource.markPostAsSynced(post.id);
            print(
              'PostRepositoryImpl.syncPosts: Successfully synced post ${post.id}',
            );
          },
        );
      }

      print('------PostRepositoryImpl.syncPosts: Sync completed');
      return const Right(null);
    } catch (e) {
      print('------PostRepositoryImpl.syncPosts: Sync error: $e');
      return Left(ServerFailure('Sync failed: ${e.toString()}'));
    }
  }
}
