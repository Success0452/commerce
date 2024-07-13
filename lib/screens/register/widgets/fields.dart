import 'package:commerce/screens/login/index.dart';
import 'package:commerce/screens/register/controller/index.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../widgets/textfield.dart';

class RegisterFields extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  const RegisterFields(
      {super.key,
      required this.email,
      required this.password,
      required this.name});

  @override
  Widget build(BuildContext context) {
    var registerController = RegisterController();
    return Column(
      children: [
        //image upload widget
        GestureDetector(
          onTap: () => registerController.pickImage(),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SvgPicture.asset('assets/svg/uploadFig.svg'),
          ),
        ),

        // setting up nameField
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextField(
            controller: name,
            label: 'Name',
            hint: 'type in your name',
            suffixIcon: const Icon(
              Icons.person_2_outlined,
              color: Colors.blue,
            ),
          ),
        ),

        // setting up emailField
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: CustomTextField(
            controller: email,
            label: 'Email',
            hint: 'type in your email',
            suffixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.blue,
            ),
          ),
        ),

        // setting up password textField
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomTextField(
            controller: password,
            label: 'Password',
            suffixIcon: const Icon(
              Icons.wifi_password_outlined,
              color: Colors.blue,
            ),
            obscureText: true,
            hint: 'type in your password',
          ),
        ),

        GestureDetector(
          onTap: () => Get.off(const LoginScreen()),
          child: const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: CustomText(
              fontSize: 14,
              text: 'Already have an account? login',
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
