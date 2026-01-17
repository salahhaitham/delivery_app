import 'package:delivery_app/Features/Home/Domain/Services/LocationService.dart';
import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepo/GetRestaurantsListImp.dart';
import 'package:delivery_app/Features/Home/presentation/Cubits/Home_Cubit/Home_Cubit.dart';

import 'package:delivery_app/Features/Home/presentation/Views/widgets/Home_ViewBody/widgets/HomeContentLoader.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Home_ViewBody/widgets/HomeViewBody.dart';
import 'package:delivery_app/core/Services/Getit_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Cubits/Home_Cubit/Home_state.dart';
import '../Cubits/Restaurants_Cubit/RestaurantsCubit.dart';
import 'widgets/LocationPermissionView.dart';


class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);
  static const routename = "homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                Restaurantscubit(getIt<GetRestaurantsListImp>()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(getIt<LocationService>())..initHome(),
          ),
        ],

        child: HomeViewBody(),
      ),
    );
  }
}



