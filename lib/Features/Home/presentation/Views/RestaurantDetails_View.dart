import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepo/GetRestaurantsDetails_Imp.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/RestaurantDetails_ViewBody.dart';
import 'package:delivery_app/core/Services/Getit_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../data/models/NearbyRestaurantModel.dart';
import '../../data/models/ResturantModel.dart';
import '../Cubits/Restaurants_Cubit/GetRstaurantMenu/get_restaurant_Menu_cubit.dart';

class RestaurantDetailS_View extends StatelessWidget {
  const RestaurantDetailS_View({Key? key, required this.nearbyrestaurantmodel})
    : super(key: key);
  final Nearbyrestaurantmodel nearbyrestaurantmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetRestaurantMenuCubit(getIt.get<GetRestaurantsDetails_Imp>())
              ..getDetails(nearbyrestaurantmodel.restaurant.id),
        child: Restaurantdetails_Viewbody_BlocBuilder(
          nearbyrestaurantmodel: nearbyrestaurantmodel,
        ),
      ),
    );
  }
}

class Restaurantdetails_Viewbody_BlocBuilder extends StatelessWidget {
  const Restaurantdetails_Viewbody_BlocBuilder({
    super.key,
    required this.nearbyrestaurantmodel,
  });
  final Nearbyrestaurantmodel nearbyrestaurantmodel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRestaurantMenuCubit,GetRestaurantMenuState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is GetRestaurantMenuLoading,
          child: state is GetRestaurantMenuSuccess
              ? Restaurantdetails_Viewbody(
                  restaurantModel: nearbyrestaurantmodel,
                  menu: state.menuItems,
                )
              : Text("there was An error "),
        );
      },
    );
  }
}
