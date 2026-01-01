import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction_board_data.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionboardState with _$TransactionboardState {
  const factory TransactionboardState.initial() = TransactionboardInitial;
  const factory TransactionboardState.loading() = TransactionboardLoading;
  const factory TransactionboardState.loaded({
    required TransactionBoardData data,
  }) = TransactionboardLoaded;
  const factory TransactionboardState.error(String message) =
      TransactionboardError;
}
