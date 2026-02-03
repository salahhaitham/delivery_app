import 'package:delivery_app/Features/checkout/data/models/foodItemOrderModel.dart';
import 'package:delivery_app/core/Services/getUser.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/enums/OrderStatus.dart';
import '../../domain/OrderEntity.dart';
import 'ShippingAddressModel.dart';

class OrderModel {
  final num totalPrice;
  final  String uId;
  final  ShippingAddressOrderModel shippingAddressOrderModel;
  final  List<FoodItemOrderModel> orderProducts;
  final String paymentMethod;
  final OrderStatus status;
  final String orderId;

  OrderModel({
    required this.orderId,
    required this.uId,
    required  this.shippingAddressOrderModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,required this.status,}
      );
  factory OrderModel.fromOrderEntity(OrderEntity OrderEntity){
    return OrderModel(
        orderId: Uuid().v4(),
        status: OrderStatus.pending,
        uId: getUser().Uid,
        shippingAddressOrderModel: ShippingAddressOrderModel.fromEntity(OrderEntity.addressEntity!),
        orderProducts: OrderEntity.cart.cartItems.map((e)=>FoodItemOrderModel.fromCartItemEntity(e)).toList(),
        paymentMethod: OrderEntity.paymentMethod==PaymentMethod.cash?"cash":"online",
        totalPrice: OrderEntity.cart.calculateTotal());
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(

      status: OrderStatus.values.firstWhere(
            (e) => e.name == map['status'],
        orElse: () => OrderStatus.pending,
      )
      ,      totalPrice: map["totalPrice"] ?? 0,
      uId: map["uid"] ?? "",
      orderId: map['orderid'],
      paymentMethod: map["paymentmethod"] ?? "cash",
      shippingAddressOrderModel: ShippingAddressOrderModel.fromMap(map),
      orderProducts: (map["orderdata"] as List<dynamic>? ?? [])
          .map((e) => FoodItemOrderModel.fromMap(e))
          .toList(),


    );
  }

  toJson() {
    final now = DateTime.now();

    final formattedDate = "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')}";
    return {
      "totalPrice": totalPrice,
      "uid": uId,
      "address": shippingAddressOrderModel.toJson(),
      "orderdata": orderProducts.map((e) => e.toJson()).toList(),
      "paymentmethod": paymentMethod,
      "status":status.name,
      "orderid":orderId,
      "orderdate":formattedDate,
    };
  }

}