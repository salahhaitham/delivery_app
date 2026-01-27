import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';

import '../../../Home/data/models/RestaurantDetails_model.dart';

class CartEntity{

 final List<CartItemEntity>cartItems;
 const CartEntity(this.cartItems);

 double calculateTotalCards(){
  double totalprice=0;
     for(var item in cartItems){
      totalprice+=item.CalculateTotalPrice();
     }
     return totalprice;
 }
 CartEntity addOrIncreaseItem(MenuItemModel foodItem) {
  final items = List<CartItemEntity>.from(cartItems);
    var index=items.indexWhere((index){
    return index.menuItemModel.id==foodItem.id;
    });
    if(index!=-1){
      items[index] = items[index].copyWith(
        count: items[index].count + 1,
      );
    }else {
     items.add(CartItemEntity(foodItem, 1));
    }
    return CartEntity(items);
 }


}