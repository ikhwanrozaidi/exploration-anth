enum RoadLevel {
  provinces,
  districts,
  roads;

  String get displayName {
    switch (this) {
      case RoadLevel.provinces:
        return 'Province/State';
      case RoadLevel.districts:
        return 'District';
      case RoadLevel.roads:
        return 'Road';
    }
  }

  int get order {
    switch (this) {
      case RoadLevel.provinces:
        return 0;
      case RoadLevel.districts:
        return 1;
      case RoadLevel.roads:
        return 2;
    }
  }

  bool isBefore(RoadLevel other) => order < other.order;
  bool isAfter(RoadLevel other) => order > other.order;
}
