import 'package:flutter/material.dart';

import '../../../data/models/NearbyRestaurantModel.dart';
import 'ResturantItem.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({super.key, required this.restaurantsList});

  final List<Nearbyrestaurantmodel> restaurantsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {},
          child: ReestaurantItem(nearbyrestaurant: restaurantsList[index]),
        ),
        childCount: restaurantsList.length,
      ),
    );
  }
}
