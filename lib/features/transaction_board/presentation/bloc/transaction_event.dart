import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionBoardEvent with _$TransactionBoardEvent {
  const factory TransactionBoardEvent.load() = LoadTransactionBoard;
  const factory TransactionBoardEvent.refresh() = RefreshTransactionBoard;
}
