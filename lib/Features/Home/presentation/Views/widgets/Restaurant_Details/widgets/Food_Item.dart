
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/AppTextStyles.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [


          Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Flexible(child: Image.network("https://freepngimg.com/thumb/apple_fruit/24454-5-apple-fruit-transparent-image.png")),
                  SizedBox(height: 24,),
                  ListTile(
                    title:   Text(
                        "unknown",
                        textAlign: TextAlign.right,
                        style:AppTextStyles.heading13semiBold
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '${0}',
                              style:AppTextStyles.body13Bold.copyWith(color: App_Colors.kSecondaryColor)
                          ),
                          TextSpan(
                              text: '/',
                              style:AppTextStyles.body13Bold.copyWith(color: App_Colors.kSecondaryColor)
                          ),
                          TextSpan(
                              text: ' الكيلو',
                              style:AppTextStyles.heading13semiBold.copyWith(color: App_Colors.kSecondaryColor)
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: App_Colors.kprimaryColor,
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  )
                ],
              ))
        ],
      ),

    );
  }
}
