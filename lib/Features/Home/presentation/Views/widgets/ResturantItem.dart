import 'package:delivery_app/Features/Auth/data/models/userModel.dart';
import 'package:delivery_app/Features/Home/Domain/extensions/OpenStatusChecker.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';
import 'package:delivery_app/Features/Home/data/models/UserLocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Services/DeliveryTimeEstimator.dart';
import '../../../Domain/Services/DistanceCalculator.dart';
import '../../../data/models/ResturantModel.dart';
import 'OpenPadge.dart';

class ReestaurantItem extends StatelessWidget {
  const ReestaurantItem({super.key, required this.nearbyrestaurant});

  final Nearbyrestaurantmodel nearbyrestaurant;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              nearbyrestaurant.restaurant.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nearbyrestaurant.restaurant.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  nearbyrestaurant.restaurant.category,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),


                    Flexible(
                      flex: 2,
                      child: Text(
                        '${nearbyrestaurant.deliveryMinutes}-${nearbyrestaurant.deliveryMinutes + 10} min',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Flexible(
                      flex: 1,
                      child: Text(
                        '${nearbyrestaurant.distanceKm.toStringAsFixed(1)} km',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),

                    const SizedBox(width: 8),


                    OpenBadge(isOpen: nearbyrestaurant.isOpen),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
