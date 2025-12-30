import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/widgets/CustomTextFormField.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({
    Key? key,
    required this.onNameSaved,
    required this.onEmailSaved,
    required this.onPasswordSaved,
  }) : super(key: key);
  final Function(String?) onNameSaved;
  final Function(String?) onEmailSaved;
  final Function(String?) onPasswordSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name", style: AppTextStyles.heading13semiBold),
        SizedBox(height: 4),
        CustomTextFormField(onSaved: onNameSaved),
        SizedBox(height: 8),
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
