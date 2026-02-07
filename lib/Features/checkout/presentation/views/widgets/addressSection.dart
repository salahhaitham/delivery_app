import 'package:delivery_app/Features/checkout/presentation/Cubit/checkout/checkout_Cubit.dart';
import 'package:delivery_app/core/Helper_Functions/Location_Storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/ShippingAdderessEntity.dart';
import 'CustomAddress_TextField.dart';
import 'address_Container.dart';

class addressSection extends StatefulWidget {
  const addressSection({Key? key,required this.formkey,required this.autoValidate}) : super(key: key);

  final GlobalKey <FormState>formkey;
  final ValueNotifier<AutovalidateMode>autoValidate;

  @override
  State<addressSection> createState() => addressSectionState();
}

class addressSectionState extends State<addressSection> with AutomaticKeepAliveClientMixin{
  String? buildingNumber,apartment,floor;

  final location= LocationStorage.getLocation();
  @override
  Widget build(BuildContext context) {
    super.build(context);


    return ValueListenableBuilder(
         valueListenable: widget.autoValidate,
         builder: (context, value, child) =>  Form(
      key: widget.formkey,
      autovalidateMode: value,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: address_Container(LocationName: location?.name ??"unKnown"),),
          CustomAddress_Textfield(hintText: "Building Number",keyboardType: TextInputType.phone, onSaved: (value) {buildingNumber=value;}),
          SizedBox(height: 20,),
          CustomAddress_Textfield(hintText: "Appartment",keyboardType: TextInputType.phone,onSaved: (value) {apartment=value;}),
          SizedBox(height: 20,),
          CustomAddress_Textfield(hintText: "Floor",keyboardType: TextInputType.phone,onSaved: (value){floor=value;}),


        ],
      ),
    ));
  }
  void saveAddressToCubit() {
    context.read<checkoutCubit>().SetAddress(
      ShippingAddressOrderEntity(
        int.tryParse(buildingNumber ?? ''),
        int.tryParse(apartment ?? ''),
        int.tryParse(floor ?? ''),
        location,null
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


