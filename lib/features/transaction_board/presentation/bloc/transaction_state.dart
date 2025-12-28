import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionBoardState with _$TransactionBoardState {
  const factory TransactionBoardState.initial() = TransactionBoardInitial;
  const factory TransactionBoardState.loading() = TransactionBoardLoading;
  const factory TransactionBoardState.ready() = TransactionBoardReady;
  const factory TransactionBoardState.error(String message) =
      TransactionBoardError;
}
