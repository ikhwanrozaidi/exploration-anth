// lib/features/transactionboard/presentation/bloc/ongoing_state.dart
import 'package:equatable/equatable.dart';

abstract class OngoingState extends Equatable {
  const OngoingState();

  @override
  List<Object?> get props => [];
}

class OngoingInitial extends OngoingState {
  const OngoingInitial();
}

class OngoingLoading extends OngoingState {
  const OngoingLoading();
}

class OngoingLoaded extends OngoingState {
  const OngoingLoaded();

  @override
  List<Object> get props => [];
}

class OngoingError extends OngoingState {
  final String message;

  const OngoingError(this.message);

  @override
  List<Object> get props => [message];
}