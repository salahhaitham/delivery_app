
import 'package:flutter/material.dart';

import '../../../../../data/models/NearbyRestaurantModel.dart';

class title_Section extends StatelessWidget {
  const title_Section({
    super.key,
    required this.restaurantModel,
  });

  final Nearbyrestaurantmodel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            restaurantModel.restaurant.name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            restaurantModel.restaurant.category,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
