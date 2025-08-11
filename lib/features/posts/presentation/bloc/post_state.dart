import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = PostInitial;

  const factory PostState.loading() = PostLoading;

  const factory PostState.loaded({
    required List<Post> posts,
    required bool isFromLocal,
    required int responseTimeMs,
    @Default(false) bool isCreating,
  }) = PostLoaded;

  const factory PostState.error({
    required String message,
    @Default([]) List<Post> cachedPosts,
  }) = PostError;

  const factory PostState.creating() = PostCreating;

  const factory PostState.created({
    required Post post,
    required List<Post> allPosts,
  }) = PostCreated;

  const factory PostState.syncing() = PostSyncing;

  const factory PostState.synced() = PostSynced;

  const factory PostState.tokenPatched() = PostTokenPatched;
}
