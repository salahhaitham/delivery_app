
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/core/utils/gen/assets.gen.dart';
import 'package:svg_flutter/svg.dart';

class OnboardingpageviewItem extends StatelessWidget {
  const OnboardingpageviewItem({Key? key,required this.image,required this.title2,required this.title1,required this.subtitle1,required this.subtitle2,required this.subtitle3}) : super(key: key);

final String image,title1,title2;
final String subtitle1,subtitle2,subtitle3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image,),
        SizedBox(height: 35,),
        Column(
          children: [
            Text(title1,style: AppTextStyles.heading23Bold.copyWith(color: Colors.black),),
            Text(title2,style: AppTextStyles.heading23Bold.copyWith(color: Colors.black),),
          ],
        ),
        SizedBox(height: 20,),
        Column(
          children: [
            Text(subtitle1,style: AppTextStyles.body11Regular.copyWith(color: Color(0xFF3B3B3B)),),
            Text(subtitle2,style: AppTextStyles.body11Regular.copyWith(color: Color(0xFF3B3B3B)),),
            Text(subtitle3,style: AppTextStyles.body11Regular.copyWith(color: Color(0xFF3B3B3B)),),
          ],
        )
      ],
    );
  }
}
