
import 'package:delivery_app/Features/Auth/data/repos/AuthRepoImpl.dart';
import 'package:delivery_app/Features/Auth/domain/repos/authRepo/AuthRepo.dart';
import 'package:delivery_app/Features/Auth/presentation/Views/widgets/AuthPageViewBody.dart';
import 'package:delivery_app/core/Services/Getit_Service.dart';
import 'package:delivery_app/core/widgets/ShowSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../Home/Domain/Services/LocationService.dart';
import '../../../Home/presentation/Views/MainView.dart';
import '../../manager/Auth-Cubit/AuthCubit.dart';

class Authpageview extends StatelessWidget {
  const Authpageview({Key? key}) : super(key: key);
static const routename="authpageview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => Authcubit(getIt<AuthRepoImp>()),
          child: AuthPageView_BlocBuider()),
    );
  }
}

class AuthPageView_BlocBuider extends StatelessWidget {
  const AuthPageView_BlocBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Authcubit, AuthState>(
      listener: (context, state) async{
        if (state is SignInFailure) {
          ShowSnackBar(context, state.message.toString());
        }
        if (state is SignUpFailure) {
          ShowSnackBar(context, state.message.toString());
        }
        if(state is SignInSuccess){


          Navigator.pushReplacementNamed(
            context,
            Mainview.routename,
          );
        }
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(
            context,
            Mainview.routename,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall:
          state is SignInLoading || state is SignUpLoading,
          child: Authpageviewbody(),
        );
      },
    );
  }
}