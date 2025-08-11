import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/core/network/auth_interceptor.dart';
import 'package:rclink_app/core/network/network_info.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../domain/usecases/create_post_usecase.dart';
import '../../domain/repositories/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

@lazySingleton
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase _getPostsUseCase;
  final CreatePostUseCase _createPostUseCase;
  final PostRepository _postRepository;
  final NetworkInfo _networkInfo;
  final AuthInterceptor _authInterceptor;

  PostBloc(
    this._getPostsUseCase,
    this._createPostUseCase,
    this._postRepository,
    this._networkInfo,
    this._authInterceptor,
  ) : super(const PostState.initial()) {
    print('---PostBloc constructor called');

    on<LoadPosts>(_onLoadPosts);
    on<CreatePost>(_onCreatePost);
    on<LoadLocalPosts>(_onLoadLocalPosts);
    on<SyncPosts>(_onSyncPosts);
    on<PatchAccessToken>(_onPatchAccessToken);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    print(
      'PostBloc._onLoadPosts called with forceRefresh: ${event.forceRefresh}',
    );

    emit(const PostState.loading());

    // Measure network check time
    final networkCheckStart = DateTime.now();
    final isConnected = await _networkInfo.isConnected;
    final networkCheckTime = DateTime.now()
        .difference(networkCheckStart)
        .inMilliseconds;

    print(
      'PostBloc._onLoadPosts: Network check completed in ${networkCheckTime}ms. Connected: $isConnected',
    );

    // Measure API response time
    final apiCallStart = DateTime.now();
    final result = await _getPostsUseCase(
      GetPostsParams(forceRefresh: event.forceRefresh),
    );

    final totalResponseTime = DateTime.now()
        .difference(apiCallStart)
        .inMilliseconds;

    result.fold(
      (failure) {
        print(
          '-----PostBloc._onLoadPosts: Failed with error: ${failure.message}',
        );
        emit(PostState.error(message: _mapFailureToMessage(failure)));
      },
      (posts) {
        print(
          'PostBloc._onLoadPosts: Success - loaded ${posts.length} posts in ${totalResponseTime}ms',
        );

        emit(
          PostState.loaded(
            posts: posts,
            isFromLocal: !isConnected || posts.isEmpty,
            responseTimeMs: totalResponseTime,
          ),
        );
      },
    );
  }

  Future<void> _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
    print('-----PostBloc._onCreatePost called for: ${event.title}');

    // Update current state to show creating
    state.maybeWhen(
      loaded: (posts, isFromLocal, responseTime, _) => emit(
        PostState.loaded(
          posts: posts,
          isFromLocal: isFromLocal,
          responseTimeMs: responseTime,
          isCreating: true,
        ),
      ),
      orElse: () => emit(const PostState.creating()),
    );

    final result = await _createPostUseCase(
      CreatePostParams(
        userId: event.userId,
        title: event.title,
        body: event.body,
      ),
    );

    result.fold(
      (failure) {
        print(
          '-----PostBloc._onCreatePost: Failed with error: ${failure.message}',
        );
        emit(PostState.error(message: _mapFailureToMessage(failure)));
      },
      (createdPost) async {
        print(
          'PostBloc._onCreatePost: Success - created post: ${createdPost.title}',
        );

        // Reload posts to show the new one
        add(const LoadPosts());
      },
    );
  }

  Future<void> _onLoadLocalPosts(
    LoadLocalPosts event,
    Emitter<PostState> emit,
  ) async {
    print('-----PostBloc._onLoadLocalPosts called');

    emit(const PostState.loading());

    final result = await _postRepository.getLocalPosts();

    result.fold(
      (failure) {
        print(
          'PostBloc._onLoadLocalPosts: Failed with error: ${failure.message}',
        );
        emit(PostState.error(message: _mapFailureToMessage(failure)));
      },
      (posts) {
        print(
          'PostBloc._onLoadLocalPosts: Success - loaded ${posts.length} local posts',
        );
        emit(
          PostState.loaded(
            posts: posts,
            isFromLocal: true,
            responseTimeMs: 0, // Local, so no network time
          ),
        );
      },
    );
  }

  Future<void> _onSyncPosts(SyncPosts event, Emitter<PostState> emit) async {
    print('-----PostBloc._onSyncPosts called');

    emit(const PostState.syncing());

    final result = await _postRepository.syncPosts();

    result.fold(
      (failure) {
        print(
          '-----PostBloc._onSyncPosts: Failed with error: ${failure.message}',
        );
        emit(PostState.error(message: _mapFailureToMessage(failure)));
      },
      (_) {
        print('-----PostBloc._onSyncPosts: Success - posts synced');
        emit(const PostState.synced());

        // Reload posts after successful sync
        add(const LoadPosts());
      },
    );
  }

  Future<void> _onPatchAccessToken(
    PatchAccessToken event,
    Emitter<PostState> emit,
  ) async {
    print('-----PostBloc._onPatchAccessToken called');

    // Patch the token in auth interceptor
    const dummyToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
    _authInterceptor.patchAccessToken(dummyToken);

    print('-----ACCESS TOKEN PATCHED - dummy token: $dummyToken');

    emit(const PostState.tokenPatched());
  }

  String _mapFailureToMessage(Failure failure) {
    print(
      '-----PostBloc._mapFailureToMessage called for: ${failure.runtimeType}',
    );

    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ValidationFailure:
        return failure.message;
      case NetworkFailure:
      case ServerFailure:
        return failure.message;
      case CacheFailure:
        return 'Local storage error: ${failure.message}';
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}
