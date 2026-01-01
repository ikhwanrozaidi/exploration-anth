// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_board_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionBoardResponseModel _$TransactionBoardResponseModelFromJson(
  Map<String, dynamic> json,
) => _TransactionBoardResponseModel(
  completeOrder: (json['completeOrder'] as num).toInt(),
  waitReceiveAmount: (json['waitReceiveAmount'] as num).toInt(),
  completeReceive: (json['completeReceive'] as num).toInt(),
  waitReleaseAmount: (json['waitReleaseAmount'] as num).toInt(),
  completeRelease: (json['completeRelease'] as num).toInt(),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TransactionBoardResponseModelToJson(
  _TransactionBoardResponseModel instance,
) => <String, dynamic>{
  'completeOrder': instance.completeOrder,
  'waitReceiveAmount': instance.waitReceiveAmount,
  'completeReceive': instance.completeReceive,
  'waitReleaseAmount': instance.waitReleaseAmount,
  'completeRelease': instance.completeRelease,
  'transactions': instance.transactions,
};
