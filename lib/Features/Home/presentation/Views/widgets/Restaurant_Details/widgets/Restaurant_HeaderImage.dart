
import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/NearbyRestaurantModel.dart';

class Restaurant_HeaderImage extends StatelessWidget {
  const Restaurant_HeaderImage({
    super.key,
    required this.restaurantModel,
    required this.height,
  });

  final RestaurantModel restaurantModel;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          restaurantModel.image,
          height: height*0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
