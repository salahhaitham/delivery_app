
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';
import 'cartActionsButton.dart';
import 'cartViewBody.dart';

class CartItemsBody extends StatelessWidget {
  const CartItemsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/menu/cheese.jpg",
          fit: BoxFit.contain,
          width: 70,
          height: 70,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Onion Pizza', style: AppTextStyles.heading16semiBold),
            Opacity(
              opacity: 0.30,
              child: Text(
                'Pizza Palace',
                style: AppTextStyles.heading13semiBold,
              ),
            ),

            Text(
              '\$ 15',
              style: AppTextStyles.body19Bold.copyWith(
                color: App_Colors.kprimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 11),
        Spacer(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CartActionButton(
                color: Color(0xffF9E1E1),
                icon: Icon(
                  Icons.remove,
                  color: App_Colors.kprimaryColor,
                ),
                ontap: () {},
              ),
              Opacity(
                opacity: 0.70,
                child: Text('1', style: AppTextStyles.body16Regular),
              ),
              CartActionButton(
                color: Color(0xffE10C33),
                icon: Icon(Icons.add, color: Colors.white),
                ontap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}