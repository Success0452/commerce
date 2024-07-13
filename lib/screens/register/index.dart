import 'package:commerce/screens/register/controller/index.dart';
import 'package:commerce/screens/register/widgets/button.dart';
import 'package:commerce/screens/register/widgets/fields.dart';
import 'package:commerce/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loader.dart';
import '../../widgets/text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // textFields controllers declaration
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();

  // loginController declaration
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(children: [
      // welcome text
      const CustomText(
        fontSize: 20,
        text: 'Welcome to Commerce',
        color: Colors.blueGrey,
      ),

      RegisterFields(email: email, password: password, name: name),

      Obx(() => registerController.isLoading.value
          ? const CustomLoader()
          : RegisterButton(
              registerController: registerController,
              email: email,
              password: password,
              name: name,
            )),
    ]);
  }
}
