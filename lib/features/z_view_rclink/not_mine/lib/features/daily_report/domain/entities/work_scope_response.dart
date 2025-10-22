import 'package:equatable/equatable.dart';

class WorkScopeResponse extends Equatable {
  final String uid;
  final String name;
  final String code;

  const WorkScopeResponse({
    required this.uid,
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [uid, name, code];
}
