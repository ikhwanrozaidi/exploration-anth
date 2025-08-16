import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/mailbox_entity.dart';

part 'mailbox_model.g.dart';

@JsonSerializable()
class MailboxModel extends Mailbox {
  const MailboxModel({
    required super.publishedAt,
    required super.sender,
    required super.title,
    required super.description,
    required super.type,
    required super.paymentId,
    required super.isRead,
  });

  factory MailboxModel.fromJson(Map<String, dynamic> json) =>
      _$MailboxModelFromJson(json);

  Map<String, dynamic> toJson() => _$MailboxModelToJson(this);

  Mailbox toEntity() => Mailbox(
        publishedAt: publishedAt,
        sender: sender,
        title: title,
        description: description,
        type: type,
        paymentId: paymentId,
        isRead: isRead,
      );
}