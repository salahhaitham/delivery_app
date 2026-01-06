import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';

import '../../../../../core/enums/LocationStatus.dart';
import '../../../Domain/Services/LocationService.dart';
import 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationService) : super(HomeInitial());

  final LocationService locationService;

  Future<void> initHome() async {
    emit(HomeLoading());

    final status = await locationService.checkPermission();

    if (status == LocationStatus.granted) {
      final position = await locationService.getLocation();
      final name = await locationService.getLocationName(position);

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
}
