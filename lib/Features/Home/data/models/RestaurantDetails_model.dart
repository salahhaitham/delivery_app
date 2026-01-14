import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';

class RestaurantDetails_model{
  final RestaurantModel restaurantModel;
  final List<MenuItemModel> menuItem;

  RestaurantDetails_model({required this.restaurantModel,required this.menuItem});
}


class MenuItemModel{
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;

  MenuItemModel({required this.id,required this.name,required this.description,required this.price,required this.image});
}