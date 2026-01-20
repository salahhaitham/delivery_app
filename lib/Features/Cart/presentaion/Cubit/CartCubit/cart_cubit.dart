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
              var cart= state.cart.addOrIncreaseItem(foodItem);

          emit(CartAdded(cart));
        } catch(e) {
          emit(CartFailure(state.cart));
        }
  }
  Future<void> removeCart(CartItemEntity cartitem) async {
    try {
     var cart=state.cart.removeCart(cartitem);
      emit(CartRemoved(cart));
    } catch(e) {
      emit(CartFailure(state.cart));
    }
  }
  void increaseItem(CartItemEntity item) {
    final updatedItems = state.cart.cartItems.map((cartItem) {
      if (cartItem.menuItemModel.id == item.menuItemModel.id) {
        return cartItem.copyWith(
          count: cartItem.count + 1,
        );
      }
      return cartItem;
    }).toList();

    emit(CartItemUpdated(CartEntity(updatedItems)));
  }
  void decreaseItem(CartItemEntity item) {
    final updatedItems = state.cart.cartItems.map((cartItem) {
      if (cartItem.menuItemModel.id == item.menuItemModel.id) {
        return cartItem.copyWith(
          count: cartItem.count - 1,
        );
      }
      return cartItem;
    }).toList();

    emit(CartItemUpdated(CartEntity(updatedItems)));
  }

}
