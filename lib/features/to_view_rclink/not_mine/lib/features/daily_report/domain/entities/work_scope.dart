import 'package:equatable/equatable.dart';

class WorkScope extends Equatable {
  final String name;
  final String code;
  final String uid;

  const WorkScope({required this.name, required this.code, required this.uid});

  @override
  List<Object?> get props => [name, code, uid];
}
