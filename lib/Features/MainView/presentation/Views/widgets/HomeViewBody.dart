
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CategoriesListView.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CategoryItem.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CustomHomeAppBar.dart';
import 'package:delivery_app/Features/MainView/presentation/Views/widgets/CustomSearchTextField.dart';
import 'package:flutter/material.dart';

class Homeviewbody extends StatelessWidget {
  const Homeviewbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Customhomeappbar(),
          SizedBox(height: 16,),
          CustomSearchtextfield(),
          SizedBox(height: 24,),
          SizedBox(
              height:  MediaQuery.of(context).size.height * 0.06,
              child: Categorieslistview()),

        ],
      ),
    );
  }
}
