import 'package:flutter/material.dart';
import 'package:mainventori/screens/login/widgets/login_form.dart';
import 'package:mainventori/screens/login/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Logo(),
          LoginForm(),
        ],
      ),
    );
  }
}
