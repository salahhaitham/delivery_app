import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';
import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';
import 'package:delivery_app/Features/Home/data/models/UserLocation.dart';
import 'package:meta/meta.dart';

import '../../../Domain/Services/DistanceCalculator.dart';
import '../../../Domain/extensions/OpenStatusChecker.dart';
import '../../../Domain/model/UserLocation1.dart';



part 'Restaurants_state.dart';

class Restaurantscubit extends Cubit<RestaurantsState> {
  Restaurantscubit(this.restaurantsRepo) : super(LoadRestaurantsInitial());
RestaurantsRepo restaurantsRepo;

  Future<void>LoadRestaurants(UserLocation1 userlocation)async{
    emit(LoadRestaurantsLoading());
    var result=await restaurantsRepo.getResturants();
    result.fold((failure){
      emit(LoadRestaurantsFailure(failure.errMessage));
    }, (restaurantsLoaded){
      final nearbyRestaurants = restaurantsLoaded.map((r) {
        final distance = DistanceCalculator.calculateKm(
          userLat: userlocation.lat,
          userLng: userlocation.lng,
          storeLat: r.lat,
          storeLng: r.lng,
        );

        final isOpen = OpenStatusChecker.isOpenNow(
          openTime: r.openTime,
          closeTime: r.closeTime,
        );

        final deliveryTime = (distance * 5).round()+10;

       return Nearbyrestaurantmodel(
          restaurant: r,
          distanceKm: distance,
          isOpen: isOpen,
          deliveryMinutes: deliveryTime,
        );
      }).toList();
nearbyRestaurants.sort(
            (a, b) => a.distanceKm.compareTo(b.distanceKm),
      );
      emit(LoadRestaurantsSuccess(nearbyRestaurants));
    });

  }
}
