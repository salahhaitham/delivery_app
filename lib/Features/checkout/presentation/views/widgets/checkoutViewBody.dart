import 'package:delivery_app/Features/checkout/presentation/views/widgets/stepsListView.dart';
import 'package:delivery_app/core/widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import 'checkoutStepsPageView.dart';

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

              }else if(index==2) {
                pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
              }
            },
          ),
         SizedBox(height: 24,),
          checkoutStepsPageView(pageController: pageController,),
          CustomButton(text: "next", onpress: () {
            if(currentIndex==0) {
              pageController.animateToPage(
                currentIndex + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }else if(currentIndex==1){
              pageController.animateToPage(
                currentIndex + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.1,)
        ],
      ),
    );
  }

}

