import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/checkout/data/models/OrderModel.dart';
import 'package:delivery_app/Features/checkout/domain/OrderEntity.dart';
import 'package:delivery_app/core/errors/Failure.dart';

abstract class OrderRepo{
  Future<Either<Failure,void>>addOrder(OrderEntity order);
}