import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo/GetRestaurantsList.dart';
import 'package:delivery_app/Features/Home/data/Mock/Mock_Resturants.dart';
import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';
import 'package:delivery_app/core/errors/Failure.dart';

class GetRestaurantsListImp extends RestaurantsRepo{
  @override
  Future<Either<Failure, List<RestaurantModel>>> getResturants() async{
    try {
      var resturants=await Mock_resturants().Restaurants;
      return right(resturants);
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }

  }


}