import 'package:equatable/equatable.dart';
import '../../../dashboard/domain/entities/user_detail.dart';
import '../../../dashboard/domain/entities/onhold_transaction.dart';
import '../../../dashboard/domain/entities/onhold_balance.dart';
import '../../domain/entities/request_transaction.dart';

abstract class TransactionBoardState extends Equatable {
  const TransactionBoardState();

  @override
  List<Object?> get props => [];
}

class TransactionBoardInitial extends TransactionBoardState {
  const TransactionBoardInitial();
}

class TransactionBoardLoading extends TransactionBoardState {
  const TransactionBoardLoading();
}

class TransactionBoardLoaded extends TransactionBoardState {
  final UserDetail userDetail;
  final OnholdBalance onholdBalance;
  final List<OnholdTransaction> onholdTransactionsTrue;
  final List<OnholdTransaction> onholdTransactionsFalse;
  final List<RequestTransaction> requestTransactions;

  const TransactionBoardLoaded({
    required this.userDetail,
    required this.onholdBalance,
    required this.onholdTransactionsTrue,
    required this.onholdTransactionsFalse,
    required this.requestTransactions,
  });

  @override
  List<Object> get props => [
        userDetail,
        onholdBalance,
        onholdTransactionsTrue,
        onholdTransactionsFalse,
        requestTransactions,
      ];
}

class TransactionBoardError extends TransactionBoardState {
  final String message;

  const TransactionBoardError(this.message);

  @override
  List<Object> get props => [message];
}

class TransactionBoardPartialLoaded extends TransactionBoardState {
  final UserDetail? userDetail;
  final OnholdBalance? onholdBalance;
  final List<OnholdTransaction>? onholdTransactionsTrue;
  final List<OnholdTransaction>? onholdTransactionsFalse;
  final List<RequestTransaction>? requestTransactions;
  final String? error;

  const TransactionBoardPartialLoaded({
    this.userDetail,
    this.onholdBalance,
    this.onholdTransactionsTrue,
    this.onholdTransactionsFalse,
    this.requestTransactions,
    this.error,
  });

  @override
  List<Object?> get props => [
        userDetail,
        onholdBalance,
        onholdTransactionsTrue,
        onholdTransactionsFalse,
        requestTransactions,
        error,
      ];
}