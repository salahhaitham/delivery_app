import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubits/Home_Cubit/Home_Cubit.dart';
import '../../Cubits/Home_Cubit/Home_state.dart';
import '../../Cubits/Restaurants_Cubit/RestaurantsCubit.dart';
import 'HomeContentLoader.dart';
import 'LocationPermissionView.dart';


  class HomeViewBody extends StatelessWidget {
    const HomeViewBody({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current is HomeReady,
        listener: (context, state) {
          final userLocation = (state as HomeReady).userLocation;
          context.read<Restaurantscubit>().LoadRestaurants(userLocation);
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLocationRequired
                ) {
              return LocationPermissionView(locationStatus: state.locationStatus,);
            }

            if (state is HomeReady) {
              return HomeContentLoader(userLocation: state.userLocation);
            }

            return const SizedBox();
          },
        ),
      );
    }
  }
