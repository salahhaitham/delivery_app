
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo.dart';
import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepoImp.dart';
import 'package:delivery_app/core/Services/DatabaseServices.dart';
import 'package:get_it/get_it.dart';

import '../../Features/Auth/data/repos/AuthRepoImpl.dart';
import 'FireStoreServices.dart';
import 'FirebaseAuthService.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FireStoreservices());
  getIt.registerLazySingleton(() => RestaurantsRepoImp());



  getIt.registerLazySingleton(() => AuthRepoImp(getIt<FirebaseAuthService>(),getIt<FireStoreservices>()));
}
