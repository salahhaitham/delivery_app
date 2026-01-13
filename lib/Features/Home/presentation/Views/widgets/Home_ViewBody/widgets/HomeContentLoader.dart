import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../Cubits/Restaurants_Cubit/RestaurantsCubit.dart';
import 'HomeContentView.dart';

class HomeContentLoader extends StatelessWidget {
  const HomeContentLoader({super.key,required this.userLocation});
  final UserLocation1 userLocation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Restaurantscubit, RestaurantsState>(
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: state is LoadRestaurantsLoading,
        child: state is LoadRestaurantsSuccess
            ? HomeContentView(restaurantsList: state.resturants, userLocation: userLocation,)
            : Text("failure"),
      ),
    );
  }
}
