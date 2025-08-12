import 'package:equatable/equatable.dart';

abstract class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object?> get props => [];
}

class LoadInbox extends InboxEvent {
  const LoadInbox();
}

class RefreshInbox extends InboxEvent {
  const RefreshInbox();
}

class MarkMessageAsRead extends InboxEvent {
  final String messageId;

  const MarkMessageAsRead(this.messageId);

  @override
  List<Object> get props => [messageId];
}