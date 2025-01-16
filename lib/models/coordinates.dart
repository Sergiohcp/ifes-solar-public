class Coordinates {
  double latitude;
  double longitude;

  Coordinates({
    this.latitude = 0,
    this.longitude = 0,
  });

  isValid() {
    return this.latitude != 0 && this.longitude != 0;
  }

  factory Coordinates.createCoordinates(Map<String, dynamic> map) {
    return Coordinates(
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
    );
  }
}
