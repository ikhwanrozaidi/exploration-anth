// lib/features/pay_boarding/features/escrow_pay/data/models/escrow_payment_model.dart
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/escrow_payment.dart';

part 'escrow_payment_model.g.dart';

@JsonSerializable()
class ProductDescriptionModel {
  final String description;

  const ProductDescriptionModel({required this.description});

  factory ProductDescriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDescriptionModelToJson(this);

  // Convert to entity
  ProductDescription toEntity() {
    return ProductDescription(description: description);
  }

  // Convert from entity
  factory ProductDescriptionModel.fromEntity(ProductDescription entity) {
    return ProductDescriptionModel(description: entity.description);
  }
}

@JsonSerializable()
class EscrowPaymentModel {
  final String productName;
  final List<ProductDescriptionModel> productDesc;
  final String productCat;
  final double price;
  final String sellerId;
  final bool isRequested;

  const EscrowPaymentModel({
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.price,
    required this.sellerId,
    required this.isRequested,
  });

  factory EscrowPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$EscrowPaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EscrowPaymentModelToJson(this);

  // Convert to entity
  EscrowPayment toEntity() {
    return EscrowPayment(
      productName: productName,
      productDesc: productDesc.map((model) => model.toEntity()).toList(),
      productCat: productCat,
      price: price,
      sellerId: sellerId,
      isRequested: isRequested,
    );
  }

  // Convert from entity
  factory EscrowPaymentModel.fromEntity(EscrowPayment entity) {
    return EscrowPaymentModel(
      productName: entity.productName,
      productDesc: entity.productDesc
          .map((desc) => ProductDescriptionModel.fromEntity(desc))
          .toList(),
      productCat: entity.productCat,
      price: entity.price,
      sellerId: entity.sellerId,
      isRequested: entity.isRequested,
    );
  }
}

@JsonSerializable()
class CreatePaymentRequest {
  final String productName;
  final List<ProductDescriptionModel> productDesc;
  final String productCat;
  final double price;
  final String sellerId;
  final bool isRequested;

  const CreatePaymentRequest({
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.price,
    required this.sellerId,
    required this.isRequested,
  });

  factory CreatePaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentRequestToJson(this);
}

@JsonSerializable()
class CreatePaymentResponse {
  final int status;
  final String message;
  final CreatePaymentData data;

  const CreatePaymentResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreatePaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentResponseToJson(this);
}

@JsonSerializable()
class CreatePaymentData {
  final String message;

  const CreatePaymentData({required this.message});

  factory CreatePaymentData.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentDataToJson(this);
}
