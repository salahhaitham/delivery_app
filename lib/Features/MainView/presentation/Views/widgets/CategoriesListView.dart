import 'package:delivery_app/Features/MainView/Domain/entities/CategoryModel.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CategoryItem.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/categoryView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categorieslistview extends StatelessWidget {
  const Categorieslistview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(id: 1, text: 'Burger', image: "assets/images/burger1.png"),
      CategoryModel(id: 2, text: 'Pizza', image: "assets/images/pizza1.png"),
      CategoryModel(id: 3, text: 'Sandwich', image: "assets/images/sandwich1.png"),
    ];

    return ListView.builder(
      itemCount: 3,
       scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 6),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Categoryview.routename,arguments: categories[index].id);
            },
            child: Categoryitem(categoryModel: categories[index])),
      ),
    );
  }
}
