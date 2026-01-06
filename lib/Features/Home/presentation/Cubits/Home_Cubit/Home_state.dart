import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:delivery_app/core/enums/LocationStatus.dart';
import 'package:geolocator/geolocator.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLocationRequired extends HomeState {
  final LocationStatus locationStatus;
  HomeLocationRequired({required this.locationStatus});
}

class HomeLocationDeniedForever extends HomeState {}

class HomeReady extends HomeState {
  final UserLocation1 userLocation;
  HomeReady(this.userLocation);
}
