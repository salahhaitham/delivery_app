import 'package:delivery_app/Features/Cart/presentaion/Views/cartView.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'HomeView.dart';
import 'widgets/MainViewBody.dart';

class Mainview extends StatefulWidget {
  const Mainview({Key? key}) : super(key: key);
  static const routename = "mainview";

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  int currentIndex = 0;
  List<Widget>screens=[
    Homeview(),
    Cartview()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Custombottomnavbar(
        currentIndex: currentIndex,
        ontapChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
     body:MainViewBody(currentViewIndex: currentIndex, screens: screens,) ,
    );
  }
}
