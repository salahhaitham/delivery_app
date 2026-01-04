import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/enums/LocationStatus.dart';
import '../model/UserLocation1.dart';

class LocationService {
  Future<LocationStatus> checkPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('📡 Service enabled: $serviceEnabled');

    if (!serviceEnabled) {
      return LocationStatus.serviceDisabled;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    print('📍 Permission BEFORE request: $permission');

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      print('📍 Permission AFTER request: $permission');
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationStatus.deniedForever;
    }

    if (permission == LocationPermission.denied) {
      return LocationStatus.denied;
    }

    // whileInUse أو always
    return LocationStatus.granted;
  }

  Future<String> getLocationName(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) return 'Unknown location';

      final place = placemarks.first;

      return [place.locality, place.subLocality].whereType<String>().join(', ');
    } catch (_) {
      return 'Unknown location';
    }
  }

  Future<Position> getLocation() {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<UserLocation1?> getUserLocation() async {
    final status = await checkPermission();

    if (status != LocationStatus.granted) {
      return null;
    }

    final position = await getLocation();
    final name = await getLocationName(position);

    return UserLocation1(
      lat: position.latitude,
      lng: position.longitude,
      name: name,
    );
  }
}
