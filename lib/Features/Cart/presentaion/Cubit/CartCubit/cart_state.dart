part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  final CartEntity cart;
  const CartState(this.cart);
}

final class CartInitial extends CartState {
  const CartInitial() : super(const CartEntity([],null));
}


final class CartItemUpdated extends CartState {
const CartItemUpdated(super.cart);
}
final class CartAdded extends CartState {
  const CartAdded(super.cart);
}

final class CartRemoved extends CartState {
 const CartRemoved(super.cart);
}
final class CartConflict extends CartState {
final  MenuItemModel menuItemModel;
const CartConflict(super.cart,this.menuItemModel);
}
final class CartCleared extends CartState {
const CartCleared(super.cart);
}

final class CartFailure extends CartState {
const CartFailure(super.cart);
}
