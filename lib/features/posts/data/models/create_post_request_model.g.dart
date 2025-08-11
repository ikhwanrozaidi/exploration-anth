// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequestModel _$CreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) => CreatePostRequestModel(
  userId: json['userId'] as int,
  title: json['title'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$CreatePostRequestModelToJson(
  CreatePostRequestModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'title': instance.title,
  'body': instance.body,
};
