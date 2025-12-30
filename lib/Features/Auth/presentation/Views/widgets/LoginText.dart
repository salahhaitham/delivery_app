
import 'package:flutter/material.dart';

import '../../../../../core/utils/AppTextStyles.dart';
import '../../../../../core/utils/App_Colors.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
    required this.iscreatingAccount,
  });

  final bool iscreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login",
          style: AppTextStyles.body16Bold.copyWith(
            color: !iscreatingAccount
                ? App_Colors.kprimaryColor
                : Colors.black,
          ),
        ),
        if (!iscreatingAccount)
          Container(
            width: 40,
            height: 1,
            color: App_Colors.kprimaryColor,
          ),
      ],
    );
  }
}
