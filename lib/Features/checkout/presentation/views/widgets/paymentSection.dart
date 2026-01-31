
import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout_Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class paymentSection extends StatelessWidget {
  const paymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     print(context.read<checkoutCubit>().state.orderEntity.address.toString());
    return const Placeholder();
  }
}