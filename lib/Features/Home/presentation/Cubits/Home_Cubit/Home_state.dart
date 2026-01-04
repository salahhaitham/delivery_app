import 'package:geolocator/geolocator.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLocationRequired extends HomeState {}

class HomeLocationDeniedForever extends HomeState {}

class HomeReady extends HomeState {
  final Position position;
  HomeReady(this.position);
}
