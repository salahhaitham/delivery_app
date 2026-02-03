import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Cart/domain/entities/cartEntity.dart';
import 'package:delivery_app/Features/checkout/domain/OrderEntity.dart';
import 'package:meta/meta.dart';

import '../../domain/ShippingAdderessEntity.dart';

part 'checkout_State.dart';

class checkoutCubit extends Cubit<checkout_States> {
  checkoutCubit(CartEntity cart) : super(OrderInitial(OrderEntity(cart:cart )));


  void selectPaymentMethod(PaymentMethod payment){
       final updatedOrder= state.orderEntity.copyWith(paymentMethod: payment);

        emit(OrderUpdated(updatedOrder));
  }
  void SetAddress(ShippingAddressOrderEntity address){
    final updatedOrder= state.orderEntity.copyWith(address: address);

    emit(OrderUpdated(updatedOrder));
  }
}
