import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';

import '../../../Home/Domain/model/UserLocation1.dart';
import 'ShippingAdderessEntity.dart';


enum PaymentMethod { cash, online }

class OrderEntity {
  final CartEntity cart;
  final PaymentMethod? paymentMethod;
 final  ShippingAddressOrderEntity? addressEntity;

   OrderEntity({
    required this.cart,
    this.paymentMethod,
    this.addressEntity,
  });

  OrderEntity copyWith({
    CartEntity? cart,
    PaymentMethod? paymentMethod,
    ShippingAddressOrderEntity? address,
  }) {
    return OrderEntity(
      cart: cart ?? this.cart,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      addressEntity: address ??this.addressEntity,
    );
  }

}
