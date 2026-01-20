import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/Food_Item.dart';

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
     cartItems[index].count++;
    }else {
     items.add(CartItemEntity(foodItem, 1));
    }
    return CartEntity(items);
 }
 CartEntity removeCart(CartItemEntity cartItem){
  final items = List<CartItemEntity>.from(cartItems);

  items.removeWhere(
       (cart) => cart.menuItemModel.id == cartItem.menuItemModel.id,
  );
  return CartEntity(items);
 }

}