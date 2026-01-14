import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/core/errors/Failure.dart';

abstract class GetrestaurantsDetails {
  Future<Either<Failure,List<MenuItemModel>>>getRestaurantMenu(String id);
}