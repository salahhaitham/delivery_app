part of 'RestaurantsCubit.dart';

@immutable
sealed class RestaurantsState {}

final class LoadRestaurantsInitial extends RestaurantsState {}
final class LoadRestaurantsLoading extends RestaurantsState {}

final class LoadRestaurantsSuccess extends RestaurantsState {
  List<Nearbyrestaurantmodel>resturants;
  LoadRestaurantsSuccess(this.resturants);
}
final class LoadRestaurantsFailure extends RestaurantsState {
  final String errorMesssage;
  LoadRestaurantsFailure(this.errorMesssage);
}


