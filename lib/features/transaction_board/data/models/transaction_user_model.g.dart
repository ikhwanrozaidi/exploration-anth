// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionUserModel _$TransactionUserModelFromJson(
  Map<String, dynamic> json,
) => _TransactionUserModel(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
);

Map<String, dynamic> _$TransactionUserModelToJson(
  _TransactionUserModel instance,
) => <String, dynamic>{'id': instance.id, 'email': instance.email};
