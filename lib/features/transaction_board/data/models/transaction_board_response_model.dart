import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction_board_data.dart';
import 'transaction_model.dart';

part 'transaction_board_response_model.freezed.dart';
part 'transaction_board_response_model.g.dart';

@freezed
abstract class TransactionBoardResponseModel
    with _$TransactionBoardResponseModel {
  const TransactionBoardResponseModel._();

  const factory TransactionBoardResponseModel({
    required int completeOrder,
    required int waitReceiveAmount,
    required int completeReceive,
    required int waitReleaseAmount,
    required int completeRelease,
    required List<TransactionModel> transactions,
  }) = _TransactionBoardResponseModel;

  factory TransactionBoardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionBoardResponseModelFromJson(json);

  /// Convert model to entity
  TransactionBoardData toEntity() {
    return TransactionBoardData(
      completeOrder: completeOrder,
      waitReceiveAmount: waitReceiveAmount,
      completeReceive: completeReceive,
      waitReleaseAmount: waitReleaseAmount,
      completeRelease: completeRelease,
      transactions: transactions.map((t) => t.toEntity()).toList(),
    );
  }
}
