import 'package:delivery_app/Features/Home/Domain/model/UserLocation1.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/gen/assets.gen.dart';

class Customhomeappbar extends StatelessWidget {
  const Customhomeappbar({
    Key? key,
    required this.userLocation,
  }) : super(key: key);

  final UserLocation1 userLocation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          "assets/images/layrsicon.svg",
          width: width * 0.05,
        ),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_sharp,
                color: App_Colors.kprimaryColor,
                size: width * 0.05,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  userLocation.name,
                  style: AppTextStyles.heading13semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.08),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(width * 0.02),
          child: Icon(
            Icons.notifications,
            color: const Color(0xffCE181B),
            size: width * 0.05,
          ),
        ),
      ],
    );
  }
}
