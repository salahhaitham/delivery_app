
import 'package:delivery_app/Features/onBoarding/widgets/onBoardingPageView_Item.dart';
import 'package:flutter/material.dart';

class Onboardingpageview extends StatelessWidget {
  const Onboardingpageview({Key? key,required this.pageController}) : super(key: key);
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller:pageController ,
      children: [
         OnboardingpageviewItem(image: "assets/images/onboarding_1.svg",
           title1: "Select the ",
           title2: "Favorities Menu",
           subtitle1: "Now eat well, don't leave the house,You can",
           subtitle2: "choose your favorite food only with",
           subtitle3: "one click",
         ),
        OnboardingpageviewItem(image: "assets/images/onboarding_2.svg",
          title1: "Good food at a ",
          title2: "Cheap price",
          subtitle1: "You can eat at expensive",
          subtitle2: "  restaurants with",
          subtitle3: "  affordable price",
        ),




      ],
      ),
    );
  }
}
