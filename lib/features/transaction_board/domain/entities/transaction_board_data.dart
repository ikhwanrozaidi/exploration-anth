import 'package:equatable/equatable.dart';
import 'transaction.dart';

class TransactionBoardData extends Equatable {
  final int completeOrder;
  final int waitReceiveAmount;
  final int completeReceive;
  final int waitReleaseAmount;
  final int completeRelease;
  final List<Transaction> transactions;

  const TransactionBoardData({
    required this.completeOrder,
    required this.waitReceiveAmount,
    required this.completeReceive,
    required this.waitReleaseAmount,
    required this.completeRelease,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
    completeOrder,
    waitReceiveAmount,
    completeReceive,
    waitReleaseAmount,
    completeRelease,
    transactions,
  ];
}
