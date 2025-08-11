import 'dart:developer';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isSynced;

  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    this.createdAt,
    this.updatedAt,
    this.isSynced = false,
  });

  Post copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
  }) {
    print('------Post.copyWith called');
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    title,
    body,
    createdAt,
    updatedAt,
    isSynced,
  ];
}
