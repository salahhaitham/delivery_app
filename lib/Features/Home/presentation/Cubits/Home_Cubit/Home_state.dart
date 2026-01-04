import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:geolocator/geolocator.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLocationRequired extends HomeState {}

class HomeLocationDeniedForever extends HomeState {}

class HomeReady extends HomeState {
  final UserLocation1 userLocation;
  HomeReady(this.userLocation);
}
