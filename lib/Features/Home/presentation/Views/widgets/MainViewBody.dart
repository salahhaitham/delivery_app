
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({Key? key,required this.currentViewIndex,required this.screens}) : super(key: key);
  final int currentViewIndex;
  final List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IndexedStack(children:screens,index: currentViewIndex,));
  }
}

