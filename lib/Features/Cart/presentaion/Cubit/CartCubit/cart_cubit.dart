import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Home/data/models/NearbyRestaurantModel.dart';

import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cartEntity.dart';
import '../../../domain/entities/cartItemEntity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> addProduct(
    MenuItemModel foodItem,
    Nearbyrestaurantmodel restaurantModel,
  ) async {
    try {
      final cartItems = List<CartItemEntity>.from(state.cart.cartItems);
      if (cartItems.isEmpty) {
        final currentRestaurant = state.cart.restaurantmodel ?? restaurantModel;
        var index = cartItems.indexWhere(
          (cartItem) => cartItem.menuItemModel.id == foodItem.id,
        );
        if (index != -1) {
          cartItems[index] = cartItems[index].copyWith(
            count: cartItems[index].count + 1,
          );
        } else {
          cartItems.add(CartItemEntity(foodItem, 1));
        }
        emit(CartAdded(CartEntity(cartItems, currentRestaurant)));
      } else {
        if (state.cart.restaurantmodel!.restaurant.id ==
            restaurantModel.restaurant.id) {
          var index = cartItems.indexWhere(
            (cartItem) => cartItem.menuItemModel.id == foodItem.id,
          );
          if (index != -1) {
            cartItems[index] = cartItems[index].copyWith(
              count: cartItems[index].count + 1,
            );
          } else {
            cartItems.add(CartItemEntity(foodItem, 1));
          }
          emit(CartAdded(CartEntity(cartItems, restaurantModel)));
        } else {
          emit(
            CartConflict(
              CartEntity(cartItems, restaurantModel),
              foodItem,
            ),
          );
        }
      }
    } catch (e) {
      emit(CartFailure(state.cart));
    }
  }

  Future<void> clearAndAddFromNewRestaurant(
    Nearbyrestaurantmodel restaurant,
    MenuItemModel foodItem,
  ) async {
    emit(CartAdded(CartEntity([CartItemEntity(foodItem, 1)], restaurant)));
  }

  Future<void> removeCart(CartItemEntity cartitem) async {
    try {
      final List<CartItemEntity> cartItems = List.from(state.cart.cartItems);
      cartItems.removeWhere(
        (cart) => cart.menuItemModel.id == cartitem.menuItemModel.id,
      );
      emit(CartRemoved(CartEntity(cartItems, state.cart.restaurantmodel)));
    } catch (e) {
      emit(CartFailure(state.cart));
    }
  }

  void increaseItem(CartItemEntity item) {
    final updatedItems = state.cart.cartItems.map((cartItem) {
      if (cartItem.menuItemModel.id == item.menuItemModel.id) {
        return cartItem.copyWith(count: cartItem.count + 1);
      }
      return cartItem;
    }).toList();

    emit(CartItemUpdated(CartEntity(updatedItems, state.cart.restaurantmodel)));
  }

  void decreaseItem(CartItemEntity item) {
    final updatedItems = state.cart.cartItems.map((cartItem) {
      if (cartItem.menuItemModel.id == item.menuItemModel.id) {
        return cartItem.copyWith(count: cartItem.count - 1);
      }
      return cartItem;
    }).toList();

    emit(CartItemUpdated(CartEntity(updatedItems, state.cart.restaurantmodel)));
  }
}
