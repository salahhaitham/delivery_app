import 'ResturantModel.dart';

class Nearbyrestaurantmodel {
  final RestaurantModel restaurant;
  final double distanceKm;
  final bool isOpen;
  final int deliveryMinutes;

  Nearbyrestaurantmodel({
    required this.restaurant,
    required this.distanceKm,
    required this.isOpen,
    required this.deliveryMinutes,
  });
}