import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_model.g.dart';
part 'post_model.freezed.dart';

@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required int userId,
    required String title,
    required String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    // print('------PostModel.fromJson called');
    return _$PostModelFromJson(json);
  }

  factory PostModel.fromEntity(Post post) {
    // print('------PostModel.fromEntity called');
    return PostModel(
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
    );
  }
}

extension PostModelX on PostModel {
  Post toEntity() {
    // print('------PostModelX.toEntity called');
    return Post(
      id: id,
      userId: userId,
      title: title,
      body: body,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
