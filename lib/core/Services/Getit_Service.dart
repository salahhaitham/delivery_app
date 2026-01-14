
import 'package:delivery_app/Features/Home/Domain/Services/LocationService.dart';
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo/GetRestaurantsList.dart';
import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepo/GetRestaurantsDetails_Imp.dart';
import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepo/GetRestaurantsListImp.dart';
import 'package:delivery_app/core/Services/DatabaseServices.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Auth/data/repos/AuthRepoImpl.dart';
import 'FireStoreServices.dart';
import 'FirebaseAuthService.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FireStoreservices());
  getIt.registerLazySingleton(() => GetRestaurantsListImp());
  getIt.registerLazySingleton(() => LocationService());
  getIt.registerLazySingleton(() => GetRestaurantsDetails_Imp());


  getIt.registerLazySingleton(() => AuthRepoImp(getIt<FirebaseAuthService>(),getIt<FireStoreservices>()));
}
