import 'package:shopping_application/data/remote/api_helper.dart';

import '../remote/urls.dart';

class UserRepository {
  ApiHelper apiHelper;

  UserRepository({required this.apiHelper});

  Future<dynamic> authUser({required String email, required String pass}) async {
    try {
      return await apiHelper.postApi(
        isHeaderRequired: false,
          url: Urls.LOGIN_USER_URL,
          bodyParams: {"email": email, "password": pass});
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerUser(
      {required String name,
      required String email,
      required String mobile_number,
      required String password}) async {
    try {
      return await apiHelper.postApi(
          isHeaderRequired: false,
          url: Urls.REGISTER_USER_URL, bodyParams: {
        "name": name,
        "mobile_number": mobile_number,
        "email": email,
        "password": password
      });
    } catch (e) {
      rethrow;
    }
  }
}
