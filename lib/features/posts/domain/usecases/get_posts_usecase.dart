import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rclink_app/core/errors/failures.dart';
import 'package:rclink_app/core/usecases/usecase.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPostsUseCase implements UseCase<List<Post>, GetPostsParams> {
  final PostRepository repository;

  GetPostsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(GetPostsParams params) async {
    print(
      'GetPostsUseCase.call started with forceRefresh: ${params.forceRefresh}',
    );
    print('Repository type: ${repository.runtimeType}');

    final result = await repository.getPosts(forceRefresh: params.forceRefresh);

    result.fold(
      (failure) =>
          print('------GetPostsUseCase.call failed: ${failure.message}'),
      (posts) => print(
        '------GetPostsUseCase.call success: fetched ${posts.length} posts',
      ),
    );

    return result;
  }
}

class GetPostsParams extends Equatable {
  final bool forceRefresh;

  const GetPostsParams({this.forceRefresh = false});

  @override
  List<Object> get props => [forceRefresh];
}
