import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  final String firstName;
  final String lastName;
  final String phone;
  final String country;
  final String email;
  final String verify;
  final String gatePoint;
  final String balance;
  final String vaccount;

  const UserDetail({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.country,
    required this.email,
    required this.verify,
    required this.gatePoint,
    required this.balance,
    required this.vaccount,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        phone,
        country,
        email,
        verify,
        gatePoint,
        balance,
        vaccount,
      ];
}