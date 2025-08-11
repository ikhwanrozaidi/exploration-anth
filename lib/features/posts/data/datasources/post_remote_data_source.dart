import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/features/playground/posts/data/models/post_model.dart';
import '../../domain/entities/post.dart';
import '../models/create_post_request_model.dart';
import 'post_api_service.dart';

abstract class PostRemoteDataSource {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Post>> createPost(Post post);
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final PostApiService _apiService;

  PostRemoteDataSourceImpl(this._apiService) {
    print('------PostRemoteDataSourceImpl constructor called');
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    print('------PostRemoteDataSourceImpl.getPosts called');

    try {
      final startTime = DateTime.now();
      print(
        '------PostRemoteDataSourceImpl.getPosts: Starting API call at $startTime',
      );

      final response = await _apiService.getPosts();

      final endTime = DateTime.now();
      final responseTime = endTime.difference(startTime).inMilliseconds;
      print(
        'PostRemoteDataSourceImpl.getPosts: API response received in ${responseTime}ms',
      );

      final posts = response.map((model) => model.toEntity()).toList();
      print(
        'PostRemoteDataSourceImpl.getPosts: Successfully converted ${posts.length} posts from API',
      );

      return Right(posts);
    } catch (e) {
      print('------PostRemoteDataSourceImpl.getPosts: Error occurred: $e');
      return Left(ServerFailure('Failed to fetch posts: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    print(
      '------PostRemoteDataSourceImpl.createPost called for: ${post.title}',
    );

    try {
      final startTime = DateTime.now();
      print(
        'PostRemoteDataSourceImpl.createPost: Starting API call at $startTime',
      );

      final request = CreatePostRequestModel(
        userId: post.userId,
        title: post.title,
        body: post.body,
      );

      final response = await _apiService.createPost(data: request);

      final endTime = DateTime.now();
      final responseTime = endTime.difference(startTime).inMilliseconds;
      print(
        'PostRemoteDataSourceImpl.createPost: API response received in ${responseTime}ms',
      );

      final createdPost = response.toEntity();
      print(
        'PostRemoteDataSourceImpl.createPost: Successfully created post with id ${createdPost.id}',
      );

      return Right(createdPost);
    } catch (e) {
      print('------PostRemoteDataSourceImpl.createPost: Error occurred: $e');
      return Left(ServerFailure('Failed to create post: ${e.toString()}'));
    }
  }
}
