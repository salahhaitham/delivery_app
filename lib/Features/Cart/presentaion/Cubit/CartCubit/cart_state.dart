part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  final CartEntity cart;
  const CartState(this.cart);
}

final class CartInitial extends CartState {
  const CartInitial() : super(const CartEntity([]));
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

final class CartFailure extends CartState {
const CartFailure(super.cart);
}
