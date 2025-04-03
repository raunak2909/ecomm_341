import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/repository/user_repository.dart';
import 'package:shopping_application/ui/screens/register/register_event.dart';
import 'package:shopping_application/ui/screens/register/register_state.dart';

import '../../../data/remote/urls.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;

  RegisterBloc({required this.userRepository}) : super(RegisterInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try {
        dynamic res = await userRepository.registerUser(
            name: event.name,
            email: event.email,
            mobile_number: event.mobile_number,
            password: event.password);

        if (res["status"]) {
          emit(RegisterLoadedState());
        } else {
          emit(RegisterErrorState(errorMsg: res["message"]));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMsg: e.toString()));
      }
    });
  }
}
