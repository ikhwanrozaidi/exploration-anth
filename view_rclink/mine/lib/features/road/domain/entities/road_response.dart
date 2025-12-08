import 'package:equatable/equatable.dart';

class RoadResponse extends Equatable {
  final String name;
  final String roadNo;
  final String uid;
  final String? districtName;
  final String? stateName;
  final String? countryName;

  const RoadResponse({
    required this.name,
    required this.roadNo,
    required this.uid,
    this.districtName,
    this.stateName,
    this.countryName,
  });

  @override
  List<Object?> get props => [
    name,
    roadNo,
    uid,
    districtName,
    stateName,
    countryName,
  ];
}
