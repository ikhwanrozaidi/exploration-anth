import 'package:equatable/equatable.dart';

class OnholdBalance extends Equatable {
  final String withheld;
  final String awaiting;

  const OnholdBalance({
    required this.withheld,
    required this.awaiting,
  });

  @override
  List<Object> get props => [withheld, awaiting];
}