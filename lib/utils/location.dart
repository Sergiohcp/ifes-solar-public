import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ifes_solar/models/coordinates.dart';

Future<Position> getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
}

Future<Coordinates?> getCoordinatesFromAddress(String address) async {
  List<Location> locations = await locationFromAddress(address);
  if (locations.isNotEmpty) {
    return Coordinates.createCoordinates({
      'latitude': locations[0].latitude,
      'longitude': locations[0].longitude
    });
  }
  return null;
}

Future<String?> getAddressFromCoordinates(double lat, double lon) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
  if (placemarks.isNotEmpty) {
    return '${placemarks[0].street} ${placemarks[0].locality} - ${placemarks[0].administrativeArea}, ${placemarks[0].country}';
  }
  return null;
}
