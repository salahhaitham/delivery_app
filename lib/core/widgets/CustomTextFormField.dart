
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, this.onSaved,this.ispassword=false,this.keyboardType
  });
 final void Function(String?)? onSaved;
 final bool ispassword;
 final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value==null || value.isEmpty){
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      keyboardType: keyboardType,
      onSaved:onSaved ,
      onTapOutside: (event) =>  FocusScope.of(context).unfocus()
      ,
      obscureText: ispassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF3B3B3B)),
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF3B3B3B)),
        ),
      ),
    );
  }
}
