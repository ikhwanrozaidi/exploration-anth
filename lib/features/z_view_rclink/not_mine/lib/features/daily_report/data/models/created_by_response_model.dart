import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/created_by_response.dart';

part 'created_by_response_model.freezed.dart';
part 'created_by_response_model.g.dart';

@freezed
abstract class CreatedByResponseModel with _$CreatedByResponseModel {
  const factory CreatedByResponseModel({
    required String uid,
    String? firstName,
    String? lastName,
  }) = _CreatedByResponseModel;

  factory CreatedByResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByResponseModelFromJson(json);
}

extension CreatedByResponseModelX on CreatedByResponseModel {
  CreatedByResponse toEntity() {
    return CreatedByResponse(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
