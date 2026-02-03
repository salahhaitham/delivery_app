import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:delivery_app/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/utils/AppTextStyles.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key? key,
    required this.menuItemModel,
    required this.restaurantModel,
  }) : super(key: key);

  final MenuItemModel menuItemModel;
  final Nearbyrestaurantmodel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼 IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(menuItemModel.image, fit: BoxFit.cover),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAME
                Text(
                  menuItemModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.heading13semiBold,
                ),

                const SizedBox(height: 4),

                // DESCRIPTION
                Text(
                  menuItemModel.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body13Regular.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Text(
                      '${menuItemModel.price} EGP',
                      style: AppTextStyles.body13Bold.copyWith(
                        color: App_Colors.kprimaryColor,
                      ),
                    ),

                    Spacer(),

                    InkWell(
                      onTap: () {
                        context.read<CartCubit>().addProduct(
                          menuItemModel,
                          restaurantModel,
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: App_Colors.kprimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
