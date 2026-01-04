

import 'package:bloc/bloc.dart';

import '../../../../../core/enums/LocationStatus.dart';
import '../../../Domain/Services/LocationService.dart';
import 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationService) : super(HomeInitial());

  final LocationService locationService;

  Future<void> initHome() async {
    emit(HomeLoading());

    final status = await locationService.checkPermission();

    switch (status) {
      case LocationStatus.granted:
        final position = await locationService.getLocation();
        emit(HomeReady(position));
        break;

      case LocationStatus.denied:
      case LocationStatus.serviceDisabled:
        emit(HomeLocationRequired());
        break;

      case LocationStatus.deniedForever:
        emit(HomeLocationDeniedForever());
        break;
    }
  }
}
