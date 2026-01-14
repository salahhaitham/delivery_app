import 'package:bloc/bloc.dart';
import 'package:delivery_app/Features/Home/Domain/repo/RestaurantsRepo/GetRestaurants_Details.dart';
import 'package:delivery_app/Features/Home/data/models/RestaurantDetails_model.dart';
import 'package:meta/meta.dart';

part 'get_restaurants_Menu_state.dart';

class GetRestaurantMenuCubit extends Cubit<GetRestaurantMenuState> {
  GetRestaurantMenuCubit(this.getrestaurantsDetails) : super(GetRestaurantMenuInitial());
GetrestaurantsDetails getrestaurantsDetails;
Future <void>getDetails(String id)async{
emit(GetRestaurantMenuLoading());
  final result=await getrestaurantsDetails.getRestaurantMenu(id);
  result.fold(
          (failure){
          emit(GetRestaurantMenuFailure(failure.errMessage));
          },
          (menu){
      emit(GetRestaurantMenuSuccess(menuItems: menu));
  });


}

}
