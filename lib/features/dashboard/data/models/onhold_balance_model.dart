import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/onhold_balance.dart';

part 'onhold_balance_model.g.dart';

@JsonSerializable()
class OnholdBalanceModel extends OnholdBalance {
  const OnholdBalanceModel({
    required super.withheld,
    required super.awaiting,
  });

  factory OnholdBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$OnholdBalanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnholdBalanceModelToJson(this);

  OnholdBalance toEntity() => OnholdBalance(
        withheld: withheld,
        awaiting: awaiting,
      );
}