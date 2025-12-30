import 'dart:math';

class DistanceCalculator {
  static double calculateKm({
    required double userLat,
    required double userLng,
    required double storeLat,
    required double storeLng,
  }) {
    const earthRadius = 6371; // KM

    final dLat = _toRad(storeLat - userLat);
    final dLng = _toRad(storeLng - userLng);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
            cos(_toRad(userLat)) *
                cos(_toRad(storeLat)) *
                sin(dLng / 2) *
                sin(dLng / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double _toRad(double degree) {
    return degree * pi / 180;
  }
}
