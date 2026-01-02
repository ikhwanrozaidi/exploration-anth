// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$SearchResponseModelToJson(
  SearchResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

SearchMessage _$SearchMessageFromJson(Map<String, dynamic> json) =>
    SearchMessage(message: json['message'] as String);

Map<String, dynamic> _$SearchMessageToJson(SearchMessage instance) =>
    <String, dynamic>{'message': instance.message};
