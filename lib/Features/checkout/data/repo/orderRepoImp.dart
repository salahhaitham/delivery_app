import 'package:dartz/dartz.dart';
import 'package:delivery_app/Features/checkout/data/models/OrderModel.dart';
import 'package:delivery_app/Features/checkout/domain/OrderEntity.dart';
import 'package:delivery_app/Features/checkout/domain/repo/orderRepo.dart';
import 'package:delivery_app/core/Services/Backend_EndPoints.dart';
import 'package:delivery_app/core/Services/DatabaseServices.dart';
import 'package:delivery_app/core/Services/FireStoreServices.dart';
import 'package:delivery_app/core/errors/Failure.dart';

class OrderRepoImp extends OrderRepo {
  final DatabaseServices databaseServices;
  OrderRepoImp(this.databaseServices);
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      var orderModel = OrderModel.fromOrderEntity(orderEntity);
     await databaseServices.adddata(
        collection: Backend_EndPoints.Koreders,
        data: orderModel.toJson(),
        documentid: orderModel.uId,
      );
      return right(null);
    } on Exception catch (e) {
     return Left(Failure(e.toString()));
    }

  }
}
