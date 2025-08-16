import 'package:equatable/equatable.dart';

abstract class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object> get props => [];
}

class GetMarketingEvent extends InboxEvent {}

class GetMailboxEvent extends InboxEvent {}

class RefreshInboxEvent extends InboxEvent {}