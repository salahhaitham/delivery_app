import 'package:delivery_app/Features/Auth/presentation/Views/AuthPageView.dart';

import 'package:delivery_app/Features/Splash/SplashView.dart';
import 'package:delivery_app/Features/onBoarding/onBoardingView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Features/Home/presentation/Views/MainView.dart';
import '../../Features/Home/presentation/Views/widgets/categoryView.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case Splashview.routename:
      return MaterialPageRoute(builder: (context) => Splashview(),);
    case Onboardingview.routename:
      return MaterialPageRoute(builder: (context) => Onboardingview(),);
    case Authpageview.routename:
      return MaterialPageRoute(builder: (context) => Authpageview(),);
    case Mainview.routename:
      return MaterialPageRoute(builder: (context) => Mainview(),);
    case CategoryView.routename:
      return MaterialPageRoute(builder: (context) => CategoryView(categoryName: settings.arguments as String,),);

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}