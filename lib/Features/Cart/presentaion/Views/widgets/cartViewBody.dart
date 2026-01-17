import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';

import 'cartItem.dart';
import 'cartItemsBody.dart';

class Cartviewbody extends StatelessWidget {
  const Cartviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double checkoutHeight = 180;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),

                    Center(
                      child: Text(
                        'Order details',
                        style: AppTextStyles.heading23Bold,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: cartItem(),
                  ),
                  childCount: 6,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: checkoutHeight),
              ),
            ],
          ),

        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xffE10C33),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub-Total',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '245 EGP',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery charge',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '10 EGP',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '255 EGP',
                        style: AppTextStyles.heading13semiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('place my order'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
