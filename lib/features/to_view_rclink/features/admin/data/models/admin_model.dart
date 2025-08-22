import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/admin.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

@freezed
abstract class AdminModel with _$AdminModel {
  const factory AdminModel({
    required int id,
    required String uid,
    required String phone,
    String? firstName,
    String? lastName,
    String? email,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);

  factory AdminModel.fromEntity(Admin admin) => AdminModel(
    id: admin.id,
    uid: admin.uid,
    firstName: admin.firstName,
    lastName: admin.lastName,
    email: admin.email,
    phone: admin.phone,
    updatedAt: admin.updatedAt,
    createdAt: admin.createdAt,
  );
}

extension AdminModelX on AdminModel {
  Admin toEntity() => Admin(
    id: id,
    uid: uid,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );
}
