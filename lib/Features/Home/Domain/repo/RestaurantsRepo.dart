import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/Home/data/Mock/Mock_Resturants.dart';
import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';
import 'package:delivery_app/core/errors/Failure.dart';

abstract class RestaurantsRepo{
  Either<Failure,List<RestaurantModel>>getResturants();
}