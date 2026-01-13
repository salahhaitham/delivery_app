
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../data/models/CategoryModel.dart';

import 'CategoryItem.dart';
import 'categoryView.dart';

class Categorieslistview extends StatelessWidget {
  const Categorieslistview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id: 1, categoryName: 'Burger', image: "assets/images/burger1.png"),
      CategoryModel(id: 2, categoryName: 'Pizza', image: "assets/images/pizza1.png"),
      CategoryModel(id: 3, categoryName: 'Sandwich', image: "assets/images/sandwich1.png"),
    ];

    return ListView.builder(
      itemCount: 3,
       scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 6),
        child: GestureDetector(
            onTap: () {

              Navigator.pushNamed(context, CategoryView.routename,arguments: categories[index].categoryName);
            },
            child: Categoryitem(categoryModel: categories[index])),
      ),
    );
  }
}
