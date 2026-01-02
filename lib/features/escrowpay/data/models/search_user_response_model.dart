import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seller_validation_entity.dart';

part 'search_user_response_model.freezed.dart';
part 'search_user_response_model.g.dart';

@freezed
abstract class SearchUserDataModel with _$SearchUserDataModel {
  const factory SearchUserDataModel({required String message}) =
      _SearchUserDataModel;

  factory SearchUserDataModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserDataModelFromJson(json);
}
