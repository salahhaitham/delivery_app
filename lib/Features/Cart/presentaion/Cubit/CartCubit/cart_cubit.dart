import 'package:bloc/bloc.dart';

import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cartEntity.dart';
import '../../../domain/entities/cartItemEntity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> addProduct(MenuItemModel foodItem) async {
    try {
      final cartItems = List<CartItemEntity>.from(state.cart.cartItems);
      var index = cartItems.indexWhere(
        (cartItem) => cartItem.menuItemModel.id == foodItem.id,
      );
      if (index != -1) {
      cartItems[index]=  cartItems[index].copyWith(count: cartItems[index].count + 1);
      } else {
        cartItems.add(CartItemEntity(foodItem, 1));
      }
      emit(CartAdded(CartEntity(cartItems)));
    } catch (e) {
      emit(CartFailure(state.cart));
    }
  }

  Future<void> removeCart(CartItemEntity cartitem) async {
    try {
      final List<CartItemEntity> cartItems = List.from(state.cart.cartItems);
      cartItems.removeWhere(
        (cart) => cart.menuItemModel.id == cartitem.menuItemModel.id,
      );
      emit(CartRemoved(CartEntity(cartItems)));
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

    emit(CartItemUpdated(CartEntity(updatedItems)));
  }

  void decreaseItem(CartItemEntity item) {
    final updatedItems = state.cart.cartItems.map((cartItem) {
      if (cartItem.menuItemModel.id == item.menuItemModel.id) {
        return cartItem.copyWith(count: cartItem.count - 1);
      }
      return cartItem;
    }).toList();

    emit(CartItemUpdated(CartEntity(updatedItems)));
  }
}
