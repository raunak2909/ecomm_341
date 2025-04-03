abstract class AuthState{}

class AuthInitialState extends AuthState{}
class AuthLoadingState extends AuthState{}
class AuthSuccessState extends AuthState{}
class AuthFailureState extends AuthState{
  String errorMsg;
  AuthFailureState({required this.errorMsg});
}