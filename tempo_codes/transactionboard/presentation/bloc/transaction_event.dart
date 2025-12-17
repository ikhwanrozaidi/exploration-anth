import 'package:equatable/equatable.dart';

abstract class TransactionBoardEvent extends Equatable {
  const TransactionBoardEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransactionBoardData extends TransactionBoardEvent {
  const LoadTransactionBoardData();
}

class RefreshTransactionBoardData extends TransactionBoardEvent {
  const RefreshTransactionBoardData();
}

class LoadOnholdTransactions extends TransactionBoardEvent {
  final bool onhold;
  final int page;
  final int size;

  const LoadOnholdTransactions({
    this.onhold = true,
    this.page = 1,
    this.size = 20,
  });

  @override
  List<Object?> get props => [onhold, page, size];
}

class LoadRequestTransactions extends TransactionBoardEvent {
  const LoadRequestTransactions();
}