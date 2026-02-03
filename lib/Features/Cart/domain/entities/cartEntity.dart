import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';


class CartEntity {
  final Nearbyrestaurantmodel?restaurantmodel;
  final List<CartItemEntity>cartItems;

  const CartEntity(this.cartItems, this.restaurantmodel);

  double calculateSubTotal() {
    double totalprice = 0;
    for (var item in cartItems) {
      totalprice += item.CalculateTotalPrice();
    }
    return totalprice;
  }

  double calculateDeliveryCharge() {
    double totalCharge = 0;
    if (restaurantmodel != null) {
      totalCharge = restaurantmodel!.distanceKm * 5;
    }

    return (10 + totalCharge).round().toDouble();
  }

  double calculateTotal() {
    double totalprice = 0;
    totalprice = calculateSubTotal() + calculateDeliveryCharge();
    return totalprice;
  }
}