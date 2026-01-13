import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';

abstract class GetrestaurantsDetails {
  Future<List<RestaurantDetails_model>>getRestaurantDetails(String id);
}