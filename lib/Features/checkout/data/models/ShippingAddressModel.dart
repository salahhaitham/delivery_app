
import 'package:delivery_app/Features/checkout/domain/entities/ShippingAdderessEntity.dart';
import 'package:delivery_app/core/Services/getUser.dart';

class ShippingAddressOrderModel {
  String? name;

  String? address;
  String? city;
  String? floorNumber;
  String? phoneNumber;

  ShippingAddressOrderModel({
    required this.name,

    required this.address,
    required this.city,
    required this.floorNumber,
    required this.phoneNumber
  });
  factory ShippingAddressOrderModel.fromMap(Map<String, dynamic> map) {
    return ShippingAddressOrderModel(
      name: map["name"] ?? "",

      address: map["address"] ?? "",
      city: map["city"] ?? "",
      floorNumber: map["floornumber"] ?? "",
      phoneNumber: map["phonenumber"]??"",
    );
  }

  factory ShippingAddressOrderModel.fromEntity(ShippingAddressOrderEntity address){
    return ShippingAddressOrderModel(
        name: getUser().UserName,

        address: address.toString(),
        city: address.userLocation!.name,
        floorNumber: address.floor.toString(),
        phoneNumber: getUser().phoneNumber
    );

  }
  toJson(){
    return {
      "name":name,
      "address":address,
      "city":city,
      "floornumber":floorNumber,
      "phonenumber":phoneNumber
    };
  }

}