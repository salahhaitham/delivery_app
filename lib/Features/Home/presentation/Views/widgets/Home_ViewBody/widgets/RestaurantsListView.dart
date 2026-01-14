import 'package:delivery_app/Features/Home/presentation/Views/RestaurantDetails_View.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/NearbyRestaurantModel.dart';
import 'ResturantItem.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({super.key, required this.restaurantsList});

  final List<Nearbyrestaurantmodel> restaurantsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
return RestaurantDetailS_View(nearbyrestaurantmodel: restaurantsList[index],);
            },));
          },
          child: ReestaurantItem(nearbyrestaurant: restaurantsList[index]),
        ),
        childCount: restaurantsList.length,
      ),
    );
  }
}
