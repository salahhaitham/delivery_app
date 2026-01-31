
import 'package:delivery_app/Features/checkout/presentation/views/widgets/shippingSection.dart';
import 'package:flutter/material.dart';

import 'addressSection.dart';
import 'paymentSection.dart';

class checkoutStepsPageView extends StatelessWidget {
  const checkoutStepsPageView({Key? key,required this.pageController,required this.formkey,required this.autoValidate,required this.addressSectionKey}) : super(key: key);
  final PageController pageController;
  final GlobalKey<FormState>formkey;
 final ValueNotifier<AutovalidateMode>autoValidate;
  final GlobalKey<addressSectionState> addressSectionKey ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return  getSteps()[index];
        },
      ),
    );
  }
  List<Widget> getSteps() {
    return [shippingSection(), addressSection(formkey: formkey,autoValidate: autoValidate,key: addressSectionKey,), paymentSection()];
  }
}