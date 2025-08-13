import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../admin/domain/entities/admin.dart';
import '../../domain/entities/auth_result.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._(); // Add private constructor for methods

  const factory LoginResponseModel({
    required String accessToken,
    required String refreshToken,
    required AdminModel admin,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  factory LoginResponseModel.fromEntity(AuthResult authResult, Admin admin) =>
      LoginResponseModel(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
        admin: AdminModel.fromEntity(admin),
      );

  // Add methods directly to the class
  AuthResult toAuthResult() => AuthResult(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  Admin toAdmin() => admin.toEntity();
}

@freezed
abstract class AdminModel with _$AdminModel {
  const AdminModel._(); // Add private constructor for methods

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

  // Add method directly to the class
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