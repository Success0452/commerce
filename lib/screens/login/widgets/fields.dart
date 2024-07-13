import 'package:commerce/screens/register/index.dart';
import 'package:commerce/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/textfield.dart';

class LoginFields extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  const LoginFields({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          onTap: () => Get.off(const RegisterScreen()),
          child: const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: CustomText(
              fontSize: 14,
              text: 'Register as new user?',
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
