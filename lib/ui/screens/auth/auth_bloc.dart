import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/data/repository/user_repository.dart';
import 'package:shopping_application/ui/screens/auth/auth_event.dart';
import 'package:shopping_application/ui/screens/auth/auth_state.dart';

import '../../../app_exceptions.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitialState()) {
    on<UserAuthEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        dynamic data =
            await userRepository.authUser(email: event.email, pass: event.pass);
        if (data["status"]) {
          emit(AuthSuccessState());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", data["tokan"]);
        } else {
          emit(AuthFailureState(errorMsg: data["message"]));
        }
      } catch (e) {
        emit(AuthFailureState(errorMsg: (e as AppExceptions).toErrorMessage()));
      }
    });
  }
}
