import 'package:commerce/screens/login/controller/index.dart';
import 'package:commerce/screens/login/widgets/button.dart';
import 'package:commerce/screens/login/widgets/fields.dart';
import 'package:commerce/widgets/loader.dart';
import 'package:commerce/widgets/text.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // textFields controllers declaration
  var email = TextEditingController();
  var password = TextEditingController();

  // loginController declaration
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(children: [
      // welcome text
      const CustomText(
        fontSize: 20,
        text: 'Welcome Back',
        color: Colors.blueGrey,
      ),

      //fields declaration
      LoginFields(
        email: email,
        password: password,
      ),

      // setting up login button
      Obx(() => loginController.isLoading.value
          ? const CustomLoader()
          : LoginButton(
              loginController: loginController,
              email: email,
              password: password,
            )),
    ]);
  }
}
