
import 'package:delivery_app/Features/Auth/presentation/Views/AuthPageView.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/MainView.dart';
import 'package:delivery_app/Features/onBoarding/onBoardingView.dart';
import 'package:delivery_app/core/Services/FireStoreServices.dart';
import 'package:delivery_app/core/Services/FirebaseAuthService.dart';
import 'package:delivery_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:delivery_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class Splashviewbody extends StatefulWidget {
  const Splashviewbody({Key? key}) : super(key: key);

  @override
  State<Splashviewbody> createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody> {
  @override
  void initState() {
     Future.delayed(Duration(seconds: 2),() {
       var isLoggedIn=FirebaseAuthService().IsLoggedIn();
     var IsOnBoardingSeen=  SharedPrefernceSinglton.getBool(KisOnBoardingSeen);
       if(isLoggedIn){
         Navigator.pushNamed(context, Mainview.routename);
       }else if (IsOnBoardingSeen){
         Navigator.pushNamed(context, Authpageview.routename);

       }else
       Navigator.pushNamed(context, Onboardingview.routename);
     },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          Image.asset("assets/images/app_icon.png",fit: BoxFit.fill,)
        ],
      ),
    );
  }
}
