import 'package:flutter/material.dart';
import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';
import '../../../../Cart/domain/entities/cartItemEntity.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({Key? key, required this.item}) : super(key: key);
  final CartItemEntity item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${item.count} X ",
          style: AppTextStyles.heading16semiBold.copyWith(
            color: App_Colors.kprimaryColor,
          ),
        ),
        Text("${item.menuItemModel.name}", style: AppTextStyles.body13Regular),
        Spacer(),
        Text(
          "${item.menuItemModel.price}",
          style: AppTextStyles.body13Regular.copyWith(
            color: App_Colors.kprimaryColor,
          ),
        ),
      ],
    );
  }
}
