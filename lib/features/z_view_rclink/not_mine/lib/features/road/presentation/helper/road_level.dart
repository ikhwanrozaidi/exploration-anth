enum RoadLevel {
  countries,
  provinces,
  districts,
  roads;

  bool isBefore(RoadLevel other) {
    return index < other.index;
  }

  bool isAfter(RoadLevel other) {
    return index > other.index;
  }

  bool isBeforeOrEqual(RoadLevel other) {
    return index <= other.index;
  }

  String get displayName {
    switch (this) {
      case RoadLevel.countries:
        return 'Country';
      case RoadLevel.provinces:
        return 'Province/State';
      case RoadLevel.districts:
        return 'District';
      case RoadLevel.roads:
        return 'Road';
    }
  }
}
