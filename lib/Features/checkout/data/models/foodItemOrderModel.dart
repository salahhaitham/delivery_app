

import '../../../Cart/domain/entities/cartItemEntity.dart';

class FoodItemOrderModel{
  String name;
  num price;

  num count;


  FoodItemOrderModel({required this.name,required this.price,required this.count});



  factory FoodItemOrderModel.fromCartItemEntity(CartItemEntity cartItem){
    return FoodItemOrderModel(

        name: cartItem.menuItemModel.name,
        price: cartItem.menuItemModel.price,

        count: cartItem.count,
   );
}
  factory FoodItemOrderModel.fromMap(Map<String, dynamic> map) {
    return FoodItemOrderModel(
      name: map["name"] ?? "",
      price: map["price"] ?? 0,

      count: map["count"] ?? 1,

    );
  }

 toJson(){
    return {
      "name":name,
      "price":price,
      "count":count,
      };
 }
}