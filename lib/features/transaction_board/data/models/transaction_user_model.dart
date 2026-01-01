import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction_user.dart';

part 'transaction_user_model.freezed.dart';
part 'transaction_user_model.g.dart';

@freezed
abstract class TransactionUserModel with _$TransactionUserModel {
  const TransactionUserModel._();

  const factory TransactionUserModel({required int id, required String email}) =
      _TransactionUserModel;

  factory TransactionUserModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionUserModelFromJson(json);

  /// Convert model to entity
  TransactionUser toEntity() {
    return TransactionUser(id: id, email: email);
  }
}
