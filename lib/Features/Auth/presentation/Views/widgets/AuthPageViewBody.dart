import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:delivery_app/core/utils/App_Colors.dart';
import 'package:delivery_app/core/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../manager/Auth-Cubit/AuthCubit.dart';
import 'AuthButton.dart';
import 'AuthViewBackgroundImg.dart';
import 'LoginText.dart';
import 'SignInField.dart';
import 'SignUpField.dart';
import 'createAccountText.dart';

class Authpageviewbody extends StatefulWidget {
  const Authpageviewbody({Key? key}) : super(key: key);

  @override
  State<Authpageviewbody> createState() => _AuthpageviewbodyState();
}

class _AuthpageviewbodyState extends State<Authpageviewbody> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool iscreatingAccount = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
 late String email, password, name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 40),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: AuthViewBackgroundImg(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iscreatingAccount = true;
                            });
                          },
                          child: createAccountText(
                            iscreatingAccount: iscreatingAccount,
                          ),
                        ),

                        SizedBox(width: 32),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              iscreatingAccount = false;
                            });
                          },
                          child: LoginText(
                            iscreatingAccount: iscreatingAccount,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                    iscreatingAccount
                        ? SignUpField(
                            onEmailSaved: (p0) => email = p0!,
                            onNameSaved: (p0) => name = p0!,
                            onPasswordSaved: (p0) => password = p0!,
                          )
                        : SignInField(
                            onEmailSaved: (p0) => email = p0!,
                            onPasswordSaved: (p0) => password = p0!,
                          ),
                    SizedBox(height: 28),
                    iscreatingAccount
                        ? AuthButton(
                            textbutton: "Sign Up",
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                context.read<Authcubit>().CreateUserWithEmailandPassword(email, password, name);
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          )
                        : AuthButton(textbutton: "Login", onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
     context.read<Authcubit>().SigninUserWithEmailandPassword(email, password,"username");
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }


                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



