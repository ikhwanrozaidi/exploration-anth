// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mailbox_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MailboxModel _$MailboxModelFromJson(Map<String, dynamic> json) => MailboxModel(
  publishedAt: json['publishedAt'] as String,
  sender: json['sender'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  type: json['type'] as String,
  paymentId: json['paymentId'] as String,
  isRead: json['isRead'] as bool,
);

Map<String, dynamic> _$MailboxModelToJson(MailboxModel instance) =>
    <String, dynamic>{
      'publishedAt': instance.publishedAt,
      'sender': instance.sender,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'paymentId': instance.paymentId,
      'isRead': instance.isRead,
    };
