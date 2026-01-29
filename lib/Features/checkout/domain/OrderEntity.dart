import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';


enum PaymentMethod { cash, online }

class OrderEntity {
  final CartEntity cart;
  final PaymentMethod? paymentMethod;
  final String? address;

  const OrderEntity({
    required this.cart,
    this.paymentMethod,
    this.address,
  });

  OrderEntity copyWith({
    CartEntity? cart,
    PaymentMethod? paymentMethod,
    String? address,
  }) {
    return OrderEntity(
      cart: cart ?? this.cart,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ??this.address,
    );
  }
}