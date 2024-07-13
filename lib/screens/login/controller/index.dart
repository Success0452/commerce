import 'dart:convert';

import 'package:commerce/screens/dashboard/index.dart';
import 'package:commerce/services/server.dart';
import 'package:commerce/util/toast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // variable declarations
  var isLoading = false.obs;
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();

  // login function
  Future<void> login(String email, String password) async {
    print('email ${email}');
    print('password$password');
    if (email.isEmpty || password.isEmpty) {
      showCustomToast(message: 'email and password are required');
      return;
    }
    try {
      isLoading.value = true;
      var body = {'email': email, 'password': password};
      var response = await postWTRequest('auth/login', body);
      final json = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        final SharedPreferences sharedPreferences = await _sharedPref;
        await sharedPreferences.setString('access_token', json['access_token']);
        await sharedPreferences.setString(
            'refresh_token', json['refresh_token']);
        showCustomToast(message: 'login success');
        Get.off(const DashboardScreen());
      } else if (response.statusCode == 401) {
        showCustomToast(message: 'account is not registered');
      } else {
        showCustomToast(message: json['message']);
      }
      isLoading.value = false;
    } catch (e) {
      showCustomToast(message: 'server error, try again later');
      isLoading.value = false;
    }
  }
}
