
import '../../Home/Domain/model/UserLocation1.dart';

class ShippingAddressOrderEntity{
  final String? userName;
  final UserLocation1? userLocation;
  final int? buildingNumber;
  final int? apartment;
  final int? floor;

  ShippingAddressOrderEntity(this.buildingNumber, this.apartment, this.floor,this.userLocation,this.userName);

  @override
  String toString() {

    return "${userLocation?.name} building:$buildingNumber Apartment:$buildingNumber";
  }

}