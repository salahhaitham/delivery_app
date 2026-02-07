part of 'checkout_Cubit.dart';

@immutable
sealed class checkout_States {
  final OrderEntity orderEntity;

  const checkout_States(this.orderEntity);
}

final class OrderInitial extends checkout_States {
  OrderInitial(super.orderEntity);
}

class OrderUpdated extends checkout_States {
  const OrderUpdated(super.order);
}

class OrderSubmitting extends checkout_States {
  const OrderSubmitting(super.order);
}

class OrderSuccess extends checkout_States {
  const OrderSuccess(super.order);
}

class OrderFailure extends checkout_States {
  final String message;
  const OrderFailure(super.order, this.message);
}
