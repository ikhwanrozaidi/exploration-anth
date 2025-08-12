import 'package:equatable/equatable.dart';

abstract class TransactionboardState extends Equatable {
  const TransactionboardState();

  @override
  List<Object?> get props => [];
}

class TransactionboardInitial extends TransactionboardState {
  const TransactionboardInitial();
}

class TransactionboardLoading extends TransactionboardState {
  const TransactionboardLoading();
}

class TransactionboardLoaded extends TransactionboardState {
  const TransactionboardLoaded();

  @override
  List<Object> get props => [];
}

class TransactionboardError extends TransactionboardState {
  final String message;

  const TransactionboardError(this.message);

  @override
  List<Object> get props => [message];
}