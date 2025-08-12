import 'package:equatable/equatable.dart';

abstract class TransactionboardEvent extends Equatable {
  const TransactionboardEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransactionboard extends TransactionboardEvent {
  const LoadTransactionboard();
}

class RefreshTransactionboard extends TransactionboardEvent {
  const RefreshTransactionboard();
}