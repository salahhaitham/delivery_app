
import 'package:delivery_app/Features/Home/data/repo/RestaurantsRepoImp.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/HomeViewBody.dart';
import 'package:delivery_app/core/Services/Getit_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Cubits/Restaurants_Cubit/RestaurantsCubit.dart';


class Homeview extends StatelessWidget {
  const Homeview({Key? key}) : super(key: key);
static const routename="homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: BlocProvider(
          create: (context) => Restaurantscubit(getIt<RestaurantsRepoImp>())..LoadRestaurants(),
          child: HomeViewBody_BlocBuilder()),
    );
  }
}



class HomeViewBody_BlocBuilder extends StatelessWidget {
  const HomeViewBody_BlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Restaurantscubit,RestaurantsState>(

        builder: (context, state) =>
        ModalProgressHUD(
            inAsyncCall: state is LoadRestaurantsLoading,
            child:state is LoadRestaurantsSuccess? Homeviewbody(restaurantsList: state.resturants):Text("failure")));
  }
}
