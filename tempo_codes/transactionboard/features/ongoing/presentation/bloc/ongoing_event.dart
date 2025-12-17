// lib/features/transactionboard/presentation/bloc/ongoing_event.dart
import 'package:equatable/equatable.dart';

abstract class OngoingEvent extends Equatable {
  const OngoingEvent();

  @override
  List<Object?> get props => [];
}

class LoadOngoingTransactions extends OngoingEvent {
  const LoadOngoingTransactions();
}

class RefreshOngoingTransactions extends OngoingEvent {
  const RefreshOngoingTransactions();
}