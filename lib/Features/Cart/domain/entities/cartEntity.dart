import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';

import '../../../Home/data/models/RestaurantDetails_model.dart';

class CartEntity{
  final Nearbyrestaurantmodel?restaurantmodel;
 final List<CartItemEntity>cartItems;
 const CartEntity(this.cartItems,this.restaurantmodel);

 double calculateTotalCards(){
  double totalprice=0;
     for(var item in cartItems){
      totalprice+=item.CalculateTotalPrice();
     }
     return totalprice;
 }
  double calculateDeliveryCharge(){
    double totalcharge=0;
     if(restaurantmodel!=null){
       totalcharge =restaurantmodel!.distanceKm*5;
     }
    return 10+double.parse(totalcharge.toStringAsFixed(1));;
  }


}