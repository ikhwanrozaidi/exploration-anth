// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketingModel _$MarketingModelFromJson(Map<String, dynamic> json) =>
    MarketingModel(
      imagePath: json['imagePath'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$MarketingModelToJson(MarketingModel instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'title': instance.title,
      'description': instance.description,
      'code': instance.code,
    };
