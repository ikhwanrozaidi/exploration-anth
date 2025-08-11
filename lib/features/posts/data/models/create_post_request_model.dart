import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post_request_model.g.dart';
part 'create_post_request_model.freezed.dart';

@freezed
abstract class CreatePostRequestModel with _$CreatePostRequestModel {
  const factory CreatePostRequestModel({
    required int userId,
    required String title,
    required String body,
  }) = _CreatePostRequestModel;

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) {
    print('------CreatePostRequestModel.fromJson called');
    return _$CreatePostRequestModelFromJson(json);
  }
}

// Add extension for toJson to avoid retrofit warning
extension CreatePostRequestModelX on CreatePostRequestModel {
  Map<String, dynamic> toJson() {
    print('------CreatePostRequestModel.toJson called');
    return {'userId': userId, 'title': title, 'body': body};
  }
}
