import 'package:equatable/equatable.dart';

class RoadResponse extends Equatable {
  final String uid;
  final String name;
  final String roadNo;
  final String? districtName;
  final String? stateName;
  final String? countryName;

  const RoadResponse({
    required this.uid,
    required this.name,
    required this.roadNo,
    this.districtName,
    this.stateName,
    this.countryName,
  });

  @override
  List<Object?> get props => [
        uid,
        name,
        roadNo,
        districtName,
        stateName,
        countryName,
      ];
}
