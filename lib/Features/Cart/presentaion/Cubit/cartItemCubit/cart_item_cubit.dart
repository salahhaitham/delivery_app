import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Cart/domain/entities/cartItemEntity.dart';
import 'package:meta/meta.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());


  Future<void>UpdateCartItem(CartItemEntity cartItem)async{
    emit(CartItemUpdated(cartItem));
  }
}
