
import 'package:delivery_app/core/utils/AppTextStyles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key, required this.textbutton, this.onPressed,
  });
final String textbutton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD61355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          textbutton,
          textAlign: TextAlign.center,
          style:AppTextStyles.body13Bold.copyWith(color: Colors.white)
        ),
      ),
    );
  }
}
