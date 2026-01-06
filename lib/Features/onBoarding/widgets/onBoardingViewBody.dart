
import 'dart:ffi';

import 'package:delivery_app/Features/Auth/presentation/Views/AuthPageView.dart';
import 'package:delivery_app/Features/onBoarding/widgets/onBoardingPageView.dart';
import 'package:delivery_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../core/widgets/CustomButtom.dart';
class onBoardingViewBody extends StatefulWidget {
  const onBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<onBoardingViewBody> createState() => _onBoardingViewBodyState();
}

class _onBoardingViewBodyState extends State<onBoardingViewBody> {
   int currentpage=0;
  PageController pageController=PageController();
  @override
  void initState() {
    pageController.addListener((){
      currentpage=pageController.page!.round();
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

         Onboardingpageview(pageController: pageController,),



         GestureDetector(
                onTap: () {
                  SharedPrefernceSinglton.setBool(KisOnBoardingSeen, true);
                  Navigator.pushNamed(context, Authpageview.routename);
                },
                child: CustomButtom()),
        SizedBox(height: 14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, Authpageview.routename),
                child: Text("Skip",style: AppTextStyles.heading16semiBold,)),
            DotsIndicator(
              position:currentpage.toDouble(),
              dotsCount: 2,
              decorator: DotsDecorator(color: Color(0xFFE6E6E6),activeColor: Color(0xFFD61355)),),
            Icon(Icons.arrow_forward)
          ],
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}

