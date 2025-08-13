// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onhold_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnholdBalanceModel _$OnholdBalanceModelFromJson(Map<String, dynamic> json) =>
    OnholdBalanceModel(
      withheld: json['withheld'] as String,
      awaiting: json['awaiting'] as String,
    );

Map<String, dynamic> _$OnholdBalanceModelToJson(OnholdBalanceModel instance) =>
    <String, dynamic>{
      'withheld': instance.withheld,
      'awaiting': instance.awaiting,
    };
