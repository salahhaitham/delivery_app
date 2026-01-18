import 'package:bloc/bloc.dart';

import 'package:delivery_app/Features/Cart/presentaion/Cubit/CartCubit/cart_cubit.dart';
import 'package:delivery_app/Features/Splash/SplashView.dart';
import 'package:delivery_app/core/Helper_Functions/GenerateRoute.dart';
import 'package:delivery_app/core/Services/Getit_Service.dart';
import 'package:delivery_app/core/Services/ShearedPreferenceSinglton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/Helper_Functions/blocobserver.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SharedPrefernceSinglton.init();

  setupServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        onGenerateRoute: onGenerateRoute,
        initialRoute: Splashview.routename,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
