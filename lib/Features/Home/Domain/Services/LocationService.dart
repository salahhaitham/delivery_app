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

  Future<String> getLocationName(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;


        final city = placemark.locality ?? '';
        final subLocality = placemark.subLocality ?? '';


        if (city.isNotEmpty && subLocality.isNotEmpty) {
          return '$city, $subLocality';
        } else if (city.isNotEmpty) {
          return city;
        } else {
          return subLocality;
        }
      }
      return 'Unknown Location';
    } catch (e) {
      print('Error getting location name: $e');
      return 'Unknown Location';
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
  Future<String> getLocationNameFromLatLng({
    required double lat,
    required double lng,
  }) async {
    final placemarks = await placemarkFromCoordinates(lat, lng);

    final place = placemarks.first;

    final city = place.locality ?? '';
    final area = place.subLocality ?? '';

    if (city.isNotEmpty && area.isNotEmpty) {
      return '$city, $area';
    } else if (city.isNotEmpty) {
      return city;
    }
    return area;
  }

}
