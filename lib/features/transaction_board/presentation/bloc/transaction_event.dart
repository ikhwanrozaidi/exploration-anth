import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionboardEvent with _$TransactionboardEvent {
  const factory TransactionboardEvent.loadTransactionboard() =
      LoadTransactionboard;
  const factory TransactionboardEvent.refreshTransactionboard() =
      RefreshTransactionboard;
  const factory TransactionboardEvent.clearCache() = ClearTransactionCache;
}
