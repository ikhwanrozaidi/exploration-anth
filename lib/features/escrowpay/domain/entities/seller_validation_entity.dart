import 'package:json_annotation/json_annotation.dart';

part 'seller_validation_entity.g.dart';

@JsonSerializable()
class SellerValidationEntity {
  final bool isValid;
  final String message;

  const SellerValidationEntity({required this.isValid, required this.message});

  factory SellerValidationEntity.fromJson(Map<String, dynamic> json) =>
      _$SellerValidationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SellerValidationEntityToJson(this);

  SellerValidationEntity copyWith({bool? isValid, String? message}) {
    return SellerValidationEntity(
      isValid: isValid ?? this.isValid,
      message: message ?? this.message,
    );
  }
}
