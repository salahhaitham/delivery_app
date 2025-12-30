
import 'package:flutter/material.dart';

import '../../../data/Mock/Mock_Resturants.dart';
import '../../../data/models/ResturantModel.dart';
import 'CategoriesListView.dart';
import 'CustomHomeAppBar.dart';
import 'CustomSearchTextField.dart';
import 'Home_Header.dart';
import 'ResturantItem.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Customhomeappbar(),
          SizedBox(height: 16,),
          CustomSearchtextfield(),
          SizedBox(height: 24,),
          SizedBox(height:  MediaQuery.of(context).size.height * 0.06,
              child: Categorieslistview()),
          HomeHeader(title: "Nearby Resturants"),
          ReestaurantItem(restaurant: Mock_resturants().Restaurants[0]),
          ReestaurantItem(restaurant: Mock_resturants().Restaurants[1]),
          ReestaurantItem(restaurant: Mock_resturants().Restaurants[2]),


        ],
      ),
    );
  }
}

