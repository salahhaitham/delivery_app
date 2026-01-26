import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:delivery_app/core/Helper_Functions/Location_Storage.dart';

import '../../../../../core/enums/LocationStatus.dart';
import '../../../Domain/Services/LocationService.dart';
import 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationService) : super(HomeInitial());

  final LocationService locationService;

  Future<void> initHome() async {
    emit(HomeLoading());

//     final userLocation =await LocationStorage.getLocation();
//     if(userLocation!=null)
// {
//   emit(HomeReady(userLocation));
//   return;
// }
    final status = await locationService.checkPermission();

    if (status == LocationStatus.granted) {
      final position = await locationService.getLocation();
      final name = await locationService.getLocationName(position);
   //  LocationStorage.saveLocation(UserLocation1(lat: position.latitude, lng: position.longitude, name: name));

      emit(
        HomeReady(
          UserLocation1(
            lat: position.latitude,
            lng: position.longitude,
            name: name,
          ),
        ),
      );
      return;
    }

    if (status == LocationStatus.denied ||
        status == LocationStatus.serviceDisabled ||
        status == LocationStatus.deniedForever) {
      emit(HomeLocationRequired(locationStatus: status));
      return;
    }
  }
  void setManualLocation(UserLocation1 location) async {
    emit(HomeLoading());
    await LocationStorage.saveLocation(location);
    emit(HomeReady(location));
  }
}
