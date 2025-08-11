import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts({bool forceRefresh = false});
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, List<Post>>> getLocalPosts();
  Future<Either<Failure, void>> syncPosts();
}
