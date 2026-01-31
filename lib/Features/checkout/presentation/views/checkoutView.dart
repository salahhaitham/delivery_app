import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';
import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout_Cubit.dart';
import 'package:delivery_app/Features/checkout/presentation/views/widgets/checkoutViewBody.dart';
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class checkoutView extends StatelessWidget {
  const checkoutView({Key? key, required this.cartEntity}) : super(key: key);
  static const String routename = "checkoutview";
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
         backgroundColor: App_Colors.kprimaryColor ,
        title: Text("checkout", style: AppTextStyles.body19Bold.copyWith(color: Colors.white)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
        ),
      ),
      body: BlocProvider(
        create: (context) => checkoutCubit(cartEntity),
        child: Container(
          color: App_Colors.kprimaryColor, // نفس لون AppBar
          child: const checkoutviewbody(),
        ),
      ),
    );
  }
}
