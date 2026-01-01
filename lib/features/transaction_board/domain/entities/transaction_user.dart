import 'package:equatable/equatable.dart';

class TransactionUser extends Equatable {
  final int id;
  final String email;

  const TransactionUser({required this.id, required this.email});

  @override
  List<Object?> get props => [id, email];
}
