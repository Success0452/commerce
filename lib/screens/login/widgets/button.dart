import 'package:commerce/screens/login/controller/index.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button.dart';

class LoginButton extends StatelessWidget {
  final LoginController loginController;
  final TextEditingController email;
  final TextEditingController password;
  const LoginButton(
      {super.key,
      required this.loginController,
      required this.password,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomButton(
        text: 'login',
        backgroundColor: Colors.blue,
        onTap: () => loginController.login(email.text, password.text),
      ),
    );
  }
}
