import 'package:equatable/equatable.dart';

class Marketing extends Equatable {
  final String imagePath;
  final String title;
  final String description;
  final String code;

  const Marketing({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.code,
  });

  @override
  List<Object> get props => [imagePath, title, description, code];
}