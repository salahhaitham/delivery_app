
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/widgets/CustomTextFormField.dart';

class SignInField extends StatelessWidget {
  const SignInField({
    Key? key,
    required this.onEmailSaved,
    required this.onPasswordSaved,
  }) : super(key: key);
  final Function(String?) onEmailSaved;
  final Function(String?) onPasswordSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email Address", style: AppTextStyles.heading13semiBold),
        SizedBox(height: 4),
        CustomTextFormField(
          onSaved: onEmailSaved,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 8),
        Text("Password", style: AppTextStyles.heading13semiBold),
        SizedBox(height: 4),
        CustomTextFormField(onSaved: onPasswordSaved, ispassword: true),
      ],
    );
  }
}
