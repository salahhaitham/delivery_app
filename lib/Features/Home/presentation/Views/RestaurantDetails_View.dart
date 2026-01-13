
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/RestaurantDetails_ViewBody.dart';
import 'package:flutter/material.dart';

import '../../data/models/NearbyRestaurantModel.dart';
import '../../data/models/ResturantModel.dart';

class RestaurantDetailS_View extends StatelessWidget {
  const RestaurantDetailS_View({Key? key,required this.restaurantModel}) : super(key: key);
  final  Nearbyrestaurantmodel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Restaurantdetails_Viewbody(restaurantModel: restaurantModel,),
    );
  }
}
