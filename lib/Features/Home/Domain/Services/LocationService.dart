import 'package:geolocator/geolocator.dart';

import '../../../../core/enums/LocationStatus.dart';

class LocationService {
  Future<LocationStatus> checkPermission() async {
    final serviceEnabled =
    await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationStatus.serviceDisabled;
    }

    LocationPermission permission =
    await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationStatus.deniedForever;
    }

    if (permission == LocationPermission.denied) {
      return LocationStatus.denied;
    }

    return LocationStatus.granted;
  }

  Future<Position> getLocation() {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

