import 'dart:developer';
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class LoadPosts extends PostEvent {
  final bool forceRefresh;

  const LoadPosts({this.forceRefresh = false});

  @override
  List<Object> get props => [forceRefresh];
}

class CreatePost extends PostEvent {
  final int userId;
  final String title;
  final String body;

  const CreatePost({
    required this.userId,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [userId, title, body];
}

class LoadLocalPosts extends PostEvent {
  const LoadLocalPosts();
}

class SyncPosts extends PostEvent {
  const SyncPosts();
}

class PatchAccessToken extends PostEvent {
  const PatchAccessToken();
}
