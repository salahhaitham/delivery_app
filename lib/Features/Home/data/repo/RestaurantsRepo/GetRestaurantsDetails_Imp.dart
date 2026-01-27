import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo/GetRestaurants_Details.dart';
import 'package:delivery_app/Features/Home/data/Mock/Mock_Resturants.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/core/errors/Failure.dart';

import '../../Mock/Mock_Menus.dart';

class GetRestaurantsDetails_Imp extends GetrestaurantMenu {
  @override
  Future<Either<Failure, List<MenuItemModel>>> getRestaurantMenu(
    String id,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final items = MockMenuItems.getItemsByRestaurantId(id);

      return right(items);
    } on Exception catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
