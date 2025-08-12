import 'package:equatable/equatable.dart';

abstract class InboxState extends Equatable {
  const InboxState();

  @override
  List<Object?> get props => [];
}

class InboxInitial extends InboxState {
  const InboxInitial();
}

class InboxLoading extends InboxState {
  const InboxLoading();
}

class InboxLoaded extends InboxState {
  const InboxLoaded();

  @override
  List<Object> get props => [];
}

class InboxError extends InboxState {
  final String message;

  const InboxError(this.message);

  @override
  List<Object> get props => [message];
}