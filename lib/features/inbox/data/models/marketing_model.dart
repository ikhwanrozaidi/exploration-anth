import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/marketing_entity.dart';

part 'marketing_model.g.dart';

@JsonSerializable()
class MarketingModel extends Marketing {
  const MarketingModel({
    required super.imagePath,
    required super.title,
    required super.description,
    required super.code,
  });

  factory MarketingModel.fromJson(Map<String, dynamic> json) =>
      _$MarketingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketingModelToJson(this);

  Marketing toEntity() => Marketing(
        imagePath: imagePath,
        title: title,
        description: description,
        code: code,
      );
}