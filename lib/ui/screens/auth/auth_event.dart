abstract class AuthEvent{}

class UserAuthEvent extends AuthEvent{
  String email;
  String pass;
  UserAuthEvent({required this.email, required this.pass});
}