
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../../../core/utils/AppTextStyles.dart';



class CustomSearchtextfield extends StatelessWidget {
  const CustomSearchtextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(

        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffFFF0F0),
          hintText: 'Search',
          hintStyle: AppTextStyles.body13Regular.copyWith(
            color: Colors.black,
          ),
          border: _buildOutlineInputBorder(),
          enabledBorder: _buildOutlineInputBorder(),
          focusedBorder: _buildOutlineInputBorder(),
         
          prefixIcon: SizedBox(
            width: 10,
            child: Center(child: Icon(Icons.search)),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: Colors.white),
    );
  }
}
