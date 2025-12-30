class DeliveryTimeEstimator {
  static int estimateMinutes(double distanceKm) {
    const avgSpeedKmPerHour = 30;
    const preparationTime = 15; // minutes

    final travelTime =
    (distanceKm / avgSpeedKmPerHour * 60).round();

    return travelTime + preparationTime;
  }
}
