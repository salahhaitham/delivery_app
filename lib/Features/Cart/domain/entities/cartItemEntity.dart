import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Restaurant_Details/widgets/Food_Item.dart';

class CartItemEntity {

 MenuItemModel menuItemModel;
 int count;

CartItemEntity(this.menuItemModel,this.count);

 double CalculateTotalPrice(){
   return count*menuItemModel.price;
 }
void increaseCount(){
     count++;
}
 void decreaseCount(){
   if(count>1){
   count--;
 }
}
 CartItemEntity copyWith({
   int? count,
 }) {
   return CartItemEntity(
   menuItemModel,count!
   );
 }
}
