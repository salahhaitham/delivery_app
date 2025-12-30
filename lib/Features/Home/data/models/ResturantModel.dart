import '../../../../../../core/utils/gen/assets.gen.dart';

class RestaurantModel {
  final String id;
  final String name;
  final String category;
  final double lat;
  final double lng;
  final String image;
  final String openTime;
  final String closeTime;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.category,
    required this.lat,
    required this.lng,
    required this.image,
    required this.openTime,
    required this.closeTime,
  });
}
