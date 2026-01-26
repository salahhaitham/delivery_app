import 'package:delivery_app/Features/checkout/presentation/views/widgets/paymentSection.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/shippingSection.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/stepsListView.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';

import 'addressSection.dart';

class checkoutviewbody extends StatefulWidget {
  const checkoutviewbody({Key? key}) : super(key: key);

  @override
  State<checkoutviewbody> createState() => _checkoutviewbodyState();
}

class _checkoutviewbodyState extends State<checkoutviewbody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController=PageController();
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          stepsListView(
            currentIndex: currentIndex,
            ontap: (index) {
              if(index ==0){
                pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              }else if(index==1){
                pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);

              }
            },
          ),
         checkoutStepsView(pageController: pageController,),
        ],
      ),
    );
  }
}
class checkoutStepsView extends StatelessWidget {
  const checkoutStepsView({Key? key,required this.pageController}) : super(key: key);
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
        return  GestureDetector(

            child: getSteps()[index]);
        },
      ),
    );
  }
  List<Widget> getSteps() {
    return [shippingSection(), addressSection(), paymentSection()];
  }
}
