import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';
import 'package:flutter/material.dart';

import '../../../data/Mock/Mock_Resturants.dart';
import '../../../data/models/ResturantModel.dart';
import 'CategoriesListView.dart';
import 'CustomHomeAppBar.dart';
import 'CustomSearchTextField.dart';
import 'Home_Header.dart';
import 'ResturantItem.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({Key? key, required this.restaurantsList})
    : super(key: key);
  final List<Nearbyrestaurantmodel> restaurantsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customhomeappbar(),
                const SizedBox(height: 16),
                CustomSearchtextfield(),
                const SizedBox(height: 24),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Categorieslistview(),
                ),
                const SizedBox(height: 16),
                HomeHeader(title: "Nearby Restaurants"),
              ],
            ),
          ),


          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ReestaurantItem(
                nearbyrestaurant: restaurantsList[index],
              ),
              childCount: restaurantsList.length,
            ),
          ),
        ],
      ),
    );
  }
}
