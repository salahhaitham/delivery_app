import 'package:bloc/bloc.dart';

import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cartEntity.dart';
import '../../../domain/entities/cartItemEntity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

   CartEntity cartEntity = CartEntity([]);

  Future<void> addProduct(MenuItemModel foodItem) async {
        try {
          cartEntity.addOrIncreaseItem(foodItem);
          emit(CartAdded());
        } catch(e) {
          emit(CartFailure());
        }
  }
  Future<void> removeCart(CartItemEntity cartitem) async {
    try {
      cartEntity.removeCart(cartitem);
      emit(CartRemoved());
    } catch(e) {
      emit(CartFailure());
    }
  }
}
