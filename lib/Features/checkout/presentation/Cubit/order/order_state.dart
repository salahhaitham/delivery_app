part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
final class AddOrderLoading extends OrderState {}
final class AddOrderSuccess extends OrderState {}
final class AddOrderFailure extends OrderState {}
