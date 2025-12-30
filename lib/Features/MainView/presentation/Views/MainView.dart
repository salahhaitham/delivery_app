import 'package:delivery_app/Features/MainView/presentation/Views/HomeView.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CustomBottomNavBar.dart';
import 'package:flutter/material.dart';

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
class MainViewBody extends StatelessWidget {
  const MainViewBody({Key? key,required this.currentViewIndex,required this.screens}) : super(key: key);
final int currentViewIndex;
  final List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IndexedStack(children:screens,index: currentViewIndex,));
  }
}

