abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  String name;
  String email;
  String mobile_number;
  String password;

  RegisterUserEvent(
      {required this.name,
      required this.email,
      required this.mobile_number,
      required this.password});
}
