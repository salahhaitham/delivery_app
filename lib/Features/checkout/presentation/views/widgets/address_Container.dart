

import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';

class address_Container extends StatelessWidget {
  const address_Container({
    super.key,
    required this.LocationName,
  });

  final String? LocationName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Color(0xffEFC7D5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
        child: Row(
          children: [
            Text("$LocationName", style: AppTextStyles.body16Bold),
            Spacer(),
            Icon(Icons.edit)
          ],
        ),
      ),
    );
  }
}