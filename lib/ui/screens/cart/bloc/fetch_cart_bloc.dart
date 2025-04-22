import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_application/data/models/cart_model.dart';
import 'package:shopping_application/data/remote/api_helper.dart';

import '../../../../data/remote/urls.dart';

part 'fetch_cart_event.dart';
part 'fetch_cart_state.dart';

class FetchCartBloc extends Bloc<FetchCartEvent, FetchCartState> {
  ApiHelper apiHelper;
  FetchCartBloc({required this.apiHelper}) : super(FetchCartInitialState()) {
    on<FetchAllCartEvent>((event, emit) async{
      emit(FetchCartLoadingState());

      try{
       dynamic res = await apiHelper.getApi(url: Urls.FETCH_CART_URL);

       if(res['status']){
         print(res['data']);
         emit(FetchCartLoadedState(cartItems: CartDataModel.fromJson(res).data!));
       } else {
         emit(FetchCartErrorState(errorMsg: res['message']));
       }

      } catch(e){
        emit(FetchCartErrorState(errorMsg: e.toString()));
      }


    });
  }
}
