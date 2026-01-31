
import 'package:flutter/material.dart';

import '../../../../../core/utils/App_Colors.dart';

class CustomAddress_Textfield extends StatelessWidget {
  const CustomAddress_Textfield({
    super.key,this.keyboardType,this.onSaved,required this.hintText
  });
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

        validator: (value) {
          if(value==null || value.isEmpty){
            return "this field is required";
          }
          return null;
        },
        keyboardType: keyboardType,
        onSaved:onSaved ,

        onTapOutside: (event) =>  FocusScope.of(context).unfocus()
        ,

        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: App_Colors.kSecondaryColor,width: 2),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:App_Colors.kSecondaryColor,width: 2),
          ),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color:App_Colors.kSecondaryColor,width: 2),
          ),
        ));
  }
}

