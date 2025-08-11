import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../models/post_model.dart';
import '../models/create_post_request_model.dart';

part 'post_api_service.g.dart';

@injectable
@RestApi()
abstract class PostApiService {
  @factoryMethod
  factory PostApiService(Dio dio) {
    print('------PostApiService factory called');
    return _PostApiService(
      dio,
      baseUrl: 'https://jsonplaceholder.typicode.com',
    );
  }

  @GET('/posts')
  Future<List<PostModel>> getPosts();

  @POST('/posts')
  Future<PostModel> createPost({@Body() required CreatePostRequestModel data});
}
