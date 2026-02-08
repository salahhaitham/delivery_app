import 'package:delivery_app/Features/checkout/data/models/OrderModel.dart';
import 'package:delivery_app/Features/checkout/domain/entities/PaybalPaymentEntity.dart';
import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout/checkout_Cubit.dart';
import 'package:delivery_app/Features/checkout/presentation/Cubit/order/order_cubit.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/addressSection.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/stepsListView.dart';
import 'package:delivery_app/core/widgets/Custom_Button.dart';
import 'package:delivery_app/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import 'checkoutStepsPageView.dart';

class checkoutviewbody extends StatefulWidget {
  const checkoutviewbody({Key? key}) : super(key: key);

  @override
  State<checkoutviewbody> createState() => _checkoutviewbodyState();
}

class _checkoutviewbodyState extends State<checkoutviewbody> {
  late PageController pageController;
  int currentIndex = 0;
  GlobalKey<FormState> formkey = GlobalKey();
  final GlobalKey<addressSectionState> addressSectionKey = GlobalKey();

  ValueNotifier<AutovalidateMode> autoValidate = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    autoValidate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          stepsListView(
            currentIndex: currentIndex,
            ontap: (index) {
              handlePageNavigation(index, context);
            },
          ),
          const SizedBox(height: 24),
          checkoutStepsPageView(
            pageController: pageController,
            formkey: formkey,
            autoValidate: autoValidate,
            addressSectionKey: addressSectionKey,
          ),
          CustomButton(
            text: currentIndex == 2 ? "Place Order" : "Next",
            onpress: () {
              if (currentIndex == 0) {
                checkPaymentMethod(context);
              } else if (currentIndex == 1) {
                validateAddressSection(context);
              } else {
                payWithPaypal(context);


              }
            },
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        ],
      ),
    );
  }

  void payWithPaypal(BuildContext context) {
     final order=context.read<checkoutCubit>().state.orderEntity;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "AZihRXBXaNlVjYkrEunJvR29qehMk71WFALYOR1ly7dUgGsAXFn-X5w5Csqrq5eQ8YZge_l7_ReH2uGh",
        secretKey: "EGbYRTEABr3CrhrdG2ykO1ccsolEcZDUTQewCwOP8aZE49Zr_qH_nxtd4owc4l51F0ZphtTcH-5U985g",
        transactions:PaypalPaymentMapper.fromOrder(order).transactions,
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          context.read<OrderCubit>().addOrder(order);
          ShowSnackBar(context, "order success");
          Navigator.pop(context);
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }

  void checkPaymentMethod(BuildContext context) {
    if (context.read<checkoutCubit>().state.orderEntity.paymentMethod != null) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      ShowSnackBar(context, "please select a payment method");
    }
  }

  void validateAddressSection(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      addressSectionKey.currentState!.saveAddressToCubit();
      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      autoValidate.value = AutovalidateMode.always;
      ShowSnackBar(context, "من فضلك أكمل البيانات");
    }
  }

  void handlePageNavigation(index, BuildContext context) {
    if (index == 0) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else if (index == 1) {
      if (context.read<checkoutCubit>().state.orderEntity.paymentMethod !=
          null) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        ShowSnackBar(context, "please select a payment method");
      }
    } else {
      validateAddressSection(context);
    }
  }
}
