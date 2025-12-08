import 'package:equatable/equatable.dart';

class CreatedByResponse extends Equatable {
  final String uid;
  final String? firstName;
  final String? lastName;

  const CreatedByResponse({
    required this.uid,
    this.firstName,
    this.lastName,
  });

  String get fullName {
    final parts = [firstName, lastName]
        .where((part) => part != null && part.isNotEmpty)
        .toList();
    return parts.isEmpty ? 'Unknown' : parts.join(' ');
  }

  @override
  List<Object?> get props => [uid, firstName, lastName];
}
