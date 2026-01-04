import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

class Customhomeappbar extends StatelessWidget {
  const Customhomeappbar({Key? key,required this.userLocation}) : super(key: key);
  final    UserLocation1 userLocation;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/images/layrsicon.svg"),
        Row(
          children: [
            Icon(Icons.location_on_sharp, color: App_Colors.kprimaryColor),
            Text(
              "${userLocation.name} "

              ,style: AppTextStyles.heading13semiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        Image.asset("assets/images/homeicon1.png"),
      ],
    );
  }
}
