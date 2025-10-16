enum LocationLevel {
  countries,
  provinces,
  districts,
  roads;

  String get displayName {
    switch (this) {
      case LocationLevel.countries:
        return 'Country';
      case LocationLevel.provinces:
        return 'Province/State';
      case LocationLevel.districts:
        return 'District';
      case LocationLevel.roads:
        return 'Road';
    }
  }

  int get order {
    switch (this) {
      case LocationLevel.countries:
        return 0;
      case LocationLevel.provinces:
        return 1;
      case LocationLevel.districts:
        return 2;
      case LocationLevel.roads:
        return 3;
    }
  }

  bool isBefore(LocationLevel other) => order < other.order;
  bool isAfter(LocationLevel other) => order > other.order;
}
