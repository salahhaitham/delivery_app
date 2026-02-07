import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/checkout/data/models/OrderModel.dart';
import 'package:delivery_app/Features/checkout/domain/OrderEntity.dart';
import 'package:delivery_app/Features/checkout/domain/repo/orderRepo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {

  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

  Future<void>addOrder(OrderEntity order)async{
     emit( AddOrderLoading());
    final result=await orderRepo.addOrder(order);
    result.fold(
            (failure){
       emit(AddOrderFailure());
    }, (success){
              emit(AddOrderSuccess());
    });


  }

}
