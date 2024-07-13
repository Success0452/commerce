import 'package:commerce/screens/register/controller/index.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button.dart';

class RegisterButton extends StatelessWidget {
  final RegisterController registerController;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  const RegisterButton(
      {super.key,
      required this.registerController,
      required this.password,
      required this.name,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomButton(
        text: 'register',
        backgroundColor: Colors.blue,
        onTap: () => registerController.register(
            email: email.text, name: name.text, password: password.text),
      ),
    );
  }
}
