
import 'package:flutter/material.dart';

import '../utils/AppTextStyles.dart';
import '../utils/App_Colors.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          color:App_Colors.kprimaryColor
      ),
      child: Text("Next",style: AppTextStyles.body16Regular.copyWith(color: Colors.white),),
    );
  }
}
