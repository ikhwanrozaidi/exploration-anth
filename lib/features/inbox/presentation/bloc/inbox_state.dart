import 'package:equatable/equatable.dart';
import '../../domain/entities/mailbox_entity.dart';
import '../../domain/entities/marketing_entity.dart';

abstract class InboxState extends Equatable {
  const InboxState();

  @override
  List<Object> get props => [];
}

class InboxInitial extends InboxState {}

class InboxLoading extends InboxState {}

class InboxLoaded extends InboxState {
  final List<Marketing> marketing;
  final List<Mailbox> mailbox;

  const InboxLoaded({
    required this.marketing,
    required this.mailbox,
  });

  @override
  List<Object> get props => [marketing, mailbox];
}

class InboxError extends InboxState {
  final String message;

  const InboxError(this.message);

  @override
  List<Object> get props => [message];
}