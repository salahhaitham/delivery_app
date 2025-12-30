
import 'package:delivery_app/Features/MainView/Domain/entities/CategoryModel.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:flutter/material.dart';

class Categoryitem extends StatelessWidget {
  const Categoryitem({Key? key, required this.categoryModel}) : super(key: key);
final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 20, bottom: 8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.70,
            color: const Color(0xFFFF0000),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
        Image.asset(
        categoryModel.image,
        width: 32,
        height: 32,
        fit: BoxFit.contain,
      )
      ,
          Text(
            categoryModel.text,
            style: AppTextStyles.heading16semiBold
          ),
        ],
      ),
    );
  }
}
