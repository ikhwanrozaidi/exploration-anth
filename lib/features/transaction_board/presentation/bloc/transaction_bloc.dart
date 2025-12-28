import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

@injectable
class TransactionBoardBloc
    extends Bloc<TransactionBoardEvent, TransactionBoardState> {
  TransactionBoardBloc() : super(const TransactionBoardState.initial()) {
    on<LoadTransactionBoard>(_onLoadTransactionBoard);
    on<RefreshTransactionBoard>(_onRefreshTransactionBoard);
  }

  Future<void> _onLoadTransactionBoard(
    LoadTransactionBoard event,
    Emitter<TransactionBoardState> emit,
  ) async {
    print('🔵 [TransactionBoardBloc] LoadTransactionBoard event received');
    emit(const TransactionBoardState.loading());

    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 500));

    print('🟢 [TransactionBoardBloc] Transaction board ready');
    emit(const TransactionBoardState.ready());
  }

  Future<void> _onRefreshTransactionBoard(
    RefreshTransactionBoard event,
    Emitter<TransactionBoardState> emit,
  ) async {
    print('🔵 [TransactionBoardBloc] RefreshTransactionBoard event received');

    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 500));

    print('🟢 [TransactionBoardBloc] Transaction board refreshed');
    emit(const TransactionBoardState.ready());
  }
}
