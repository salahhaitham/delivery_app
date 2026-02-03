import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/Features/Home/data/models/ResturantModel.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/Food_Item.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:delivery_app/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/NearbyRestaurantModel.dart';
import 'Info_Row.dart';
import 'Restaurant_HeaderImage.dart';
import 'Restaurant_Info_Item.dart';
import 'Title_Section.dart';

class Restaurantdetails_Viewbody extends StatelessWidget {
  const Restaurantdetails_Viewbody({
    Key? key,
    required this.restaurantModel,
    required this.menu,
  }) : super(key: key);

  final Nearbyrestaurantmodel restaurantModel;
  final List<MenuItemModel> menu;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;
    return BlocListener<CartCubit,CartState>(
      listener: (context, state) {
        if(state is CartAdded ){
          ShowSnackBar(context, "item added succssfully ");
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Restaurant_HeaderImage(
                  restaurantModel: restaurantModel.restaurant,
                  height: height,
                ),

                const SizedBox(height: 16),

                title_Section(restaurantModel: restaurantModel),

                const SizedBox(height: 16),

                Info_Row(restaurantModel: restaurantModel),

                const SizedBox(height: 24),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Divider(),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver:  SliverGrid(
              delegate: SliverChildBuilderDelegate(
                      childCount: 6,
                      (context, index) => FoodItem(menuItemModel: menu[index],restaurantModel: restaurantModel,)),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.58
              ),
            ),
          ),
        ],
      ),
    );
  }
}
