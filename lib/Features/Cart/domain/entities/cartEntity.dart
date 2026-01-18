import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/Food_Item.dart';

class CartEntity{
 List<CartItemEntity>cartItems;

 CartEntity(this.cartItems);

 double calculateTotalCards(){
  double totalprice=0;
     for(var item in cartItems){
      totalprice+=item.CalculateTotalPrice();
     }
     return totalprice;
 }
 void addOrIncreaseItem(MenuItemModel foodItem) {
  for (var item in cartItems) {
   if (item.menuItemModel.name == foodItem.name) {
    item.increaseCount();
    return;
   }
  }
  cartItems.add(CartItemEntity(foodItem, 1));
 }
 void removeCart(CartItemEntity cartItem){
  cartItems.removeWhere(
       (cart) => cart.menuItemModel.name == cartItem.menuItemModel.name,
  );
 }
}