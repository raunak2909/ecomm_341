import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/app_exceptions.dart';
import 'package:shopping_application/data/models/product_model.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/ui/screens/product/product_event.dart';
import 'package:shopping_application/ui/screens/product/product_state.dart';

import '../../../data/remote/urls.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiHelper apiHelper;

  ProductBloc({required this.apiHelper}) : super(ProductInitialState()) {
    on<GetAllProductEvent>((event, emit) async{
      emit(ProductLoadingState());

      try {
        dynamic mData = await apiHelper.postApi(url: Urls.FETCH_PRODUCTS_URL);
        if(mData["status"]){
          emit(ProductLoadedState(mProducts: ProductDataModel.fromJson(mData).data!));
        } else {
          emit(ProductErrorState(errorMsg: mData["message"]));
        }

      } catch (e) {
        emit(
            ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}
