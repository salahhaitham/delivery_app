
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';
import '../../../domain/OrderEntity.dart';

class deliveryChargeRow extends StatelessWidget {
  const deliveryChargeRow({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Delivery charge"),
        Spacer(),
        Text(
          "${order.cart.calculateDeliveryCharge()}",
          style: AppTextStyles.body13Regular.copyWith(
            color: App_Colors.kprimaryColor,
          ),
        ),
      ],
    );
  }
}
