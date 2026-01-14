part of 'get_restaurant_Menu_cubit.dart';

@immutable
sealed class GetRestaurantMenuState {}

final class GetRestaurantMenuInitial extends GetRestaurantMenuState {}
final class GetRestaurantMenuLoading extends GetRestaurantMenuState {}
final class GetRestaurantMenuSuccess extends GetRestaurantMenuState {
  final List<MenuItemModel>menuItems;
  GetRestaurantMenuSuccess({required this.menuItems});
}



final class GetRestaurantMenuFailure extends GetRestaurantMenuState {
  final String errMessage;
  GetRestaurantMenuFailure(this.errMessage);
}


