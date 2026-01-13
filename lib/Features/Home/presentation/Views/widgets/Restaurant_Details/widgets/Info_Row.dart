import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/NearbyRestaurantModel.dart';
import 'Restaurant_Info_Item.dart';

class Info_Row extends StatelessWidget {
  const Info_Row({
    super.key,
    required this.restaurantModel,
  });

  final Nearbyrestaurantmodel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Restaurant_InfoItem(icon: Icons.location_on, text:"${restaurantModel.distanceKm.toStringAsFixed(1)} km",color: App_Colors.kprimaryColor,textColor: Colors.black,),
          Restaurant_InfoItem(icon: Icons.timer, text: "${restaurantModel.deliveryMinutes} - ${restaurantModel.deliveryMinutes+10} min",color: App_Colors.kprimaryColor,textColor: Colors.black,),
          restaurantModel.isOpen?
          Restaurant_InfoItem(
            icon: Icons.circle,
            text: 'Open',color: Colors.green,textColor: Colors.black,
          ):Restaurant_InfoItem(
            icon: Icons.circle,
            text: 'close',color: Colors.red,textColor: Colors.red,
          ),
          Restaurant_InfoItem(
            icon: Icons.star,
            text: '4.5',color: Colors.orange,textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}