import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/core/usecases/usecase.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class CreatePostUseCase implements UseCase<Post, CreatePostParams> {
  final PostRepository repository;

  CreatePostUseCase(this.repository);

  @override
  Future<Either<Failure, Post>> call(CreatePostParams params) async {
    print('------CreatePostUseCase.call started');

    // Validate post data
    if (params.title.isEmpty) {
      print('------CreatePostUseCase.call failed: Title cannot be empty');
      return const Left(ValidationFailure('Title cannot be empty'));
    }

    if (params.body.isEmpty) {
      print('------CreatePostUseCase.call failed: Body cannot be empty');
      return const Left(ValidationFailure('Body cannot be empty'));
    }

    final post = Post(
      id: DateTime.now().millisecondsSinceEpoch, // Generate temporary ID
      userId: params.userId,
      title: params.title,
      body: params.body,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    print('------CreatePostUseCase.call delegating to repository');
    final result = await repository.createPost(post);

    result.fold(
      (failure) =>
          print('------CreatePostUseCase.call failed: ${failure.message}'),
      (post) => print(
        'CreatePostUseCase.call success: created post with id ${post.id}',
      ),
    );

    return result;
  }
}

class CreatePostParams extends Equatable {
  final int userId;
  final String title;
  final String body;

  const CreatePostParams({
    required this.userId,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [userId, title, body];
}
