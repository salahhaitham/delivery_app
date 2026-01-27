import 'package:delivery_app/Features/checkout/presentation/views/widgets/shipItem.dart';
import 'package:flutter/material.dart';

class shippingSection extends StatefulWidget {
  const shippingSection({Key? key}) : super(key: key);

  @override
  State<shippingSection> createState() => _shippingSectionState();
}

class _shippingSectionState extends State<shippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shipitem(
          title: "Payment upon receipt",
          subTitle: "Delivery from place",
          price: 40,
          isSelected: selectedIndex==0,
          onaTap: () {
         setState(() {
            selectedIndex=0;
         });
          },
        ),
        SizedBox(height: 16,),
        Shipitem(
          title: "Buy now and pay later",
          subTitle: "Please select a payment method",
          price: 1000,
          isSelected:selectedIndex==1,
          onaTap: () {
            setState(() {
                 selectedIndex=1;
            });
          },
        ),
      ],
    );
  }
}
