
import 'package:flutter/material.dart';

import '../../../data/Mock/Mock_Resturants.dart';
import '../../../data/models/ResturantModel.dart';


class CategoryView extends StatefulWidget {
  const CategoryView({Key? key,required this.categoryName}) : super(key: key);
  static const routename="categoryView";
  final String categoryName;
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {




@override
  void initState() {
    super.initState();
    var filterdResurants =Mock_resturants().Restaurants.where((r)=>widget.categoryName==r.category).toList();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName),centerTitle: true,),

      );

  }
}
