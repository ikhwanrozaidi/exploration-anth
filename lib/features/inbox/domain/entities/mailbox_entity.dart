import 'package:equatable/equatable.dart';

class Mailbox extends Equatable {
  final String publishedAt;
  final String sender;
  final String title;
  final String description;
  final String type;
  final String paymentId;
  final bool isRead;

  const Mailbox({
    required this.publishedAt,
    required this.sender,
    required this.title,
    required this.description,
    required this.type,
    required this.paymentId,
    required this.isRead,
  });

  @override
  List<Object> get props => [
        publishedAt,
        sender,
        title,
        description,
        type,
        paymentId,
        isRead,
      ];
}