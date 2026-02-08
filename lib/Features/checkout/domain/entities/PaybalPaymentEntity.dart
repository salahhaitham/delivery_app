import 'OrderEntity.dart';

class PaypalPaymentEntity {
  final List<Map<String, dynamic>> transactions;

  PaypalPaymentEntity({required this.transactions});
}
class PaypalPaymentMapper {
  static PaypalPaymentEntity fromOrder(OrderEntity order) {
    final cart = order.cart;

    final items = cart.cartItems.map((cartItem) {
      return {
        "name": cartItem.menuItemModel.name,
        "quantity": cartItem.count,
        "price": cartItem.menuItemModel.price.toStringAsFixed(0),
        "currency": "USD",
      };
    }).toList();

    final subTotal = cart.calculateSubTotal();
    final delivery = cart.calculateDeliveryCharge();
    final total = cart.calculateTotal();

    return PaypalPaymentEntity(
      transactions: [
        {
          "amount": {
            "total": total.toStringAsFixed(0),
            "currency": "USD",
            "details": {
              "subtotal": subTotal.toStringAsFixed(0),
              "shipping": delivery.toStringAsFixed(0),
              "shipping_discount": 0
            }
          },
          "description": "Order Payment",
          "item_list": {
            "items": items,
          }
        }
      ],
    );
  }
}
