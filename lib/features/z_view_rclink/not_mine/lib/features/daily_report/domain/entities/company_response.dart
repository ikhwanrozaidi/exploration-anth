import 'package:equatable/equatable.dart';

class CompanyResponse extends Equatable {
  final String uid;
  final String name;

  const CompanyResponse({required this.uid, required this.name});

  @override
  List<Object?> get props => [uid, name];
}
