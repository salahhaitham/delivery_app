import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';

import '../../Home/Domain/model/UserLocation1.dart';


enum PaymentMethod { cash, online }

class OrderEntity {
  final CartEntity cart;
  final PaymentMethod? paymentMethod;
   AddressDetailsEntity? address;

   OrderEntity({
    required this.cart,
    this.paymentMethod,
    this.address,
  });

  OrderEntity copyWith({
    CartEntity? cart,
    PaymentMethod? paymentMethod,
    AddressDetailsEntity? address,
  }) {
    return OrderEntity(
      cart: cart ?? this.cart,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ??this.address,
    );
  }

}
class AddressDetailsEntity{
  final UserLocation1? userLocation;
  final int? buildingNumber;
  final int? apartment;
  final int? floor;

  AddressDetailsEntity(this.buildingNumber, this.apartment, this.floor,this.userLocation);

  @override
  String toString() {

    return "$buildingNumber $apartment $floor";
  }

}