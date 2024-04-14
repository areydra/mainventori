import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/store/models/user.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/text_input.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  void onPressButtonLogin() {
    final userAction = ref.read(userStore.notifier);

    if (textEmail.text == 'admin@user.com' && textPassword.text == 'admin') {
      userAction.setUser(User(email: textEmail.text, isAdmin: true));
    }

    if (textEmail.text == 'staff@user.com' && textPassword.text == 'user') {
      userAction.setUser(User(email: textEmail.text, isAdmin: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/logos/mawavi.png'),
          width: 100,
          height: 48,
        ),
        const SizedBox(height: 24),
        const Text(
          'Masuk ke akun Anda',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Selamat datang kembali! Silakan masukkan detail akun Anda',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(102, 112, 133, 1),
          ),
        ),
        const SizedBox(height: 32),
        TextInput(
          textController: textEmail,
          label: 'Email',
          hintTextField: 'Masukkan email Anda',
          isError: false,
          width: 360,
          textColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        const SizedBox(height: 8),
        TextInput(
          textController: textPassword,
          label: 'Password',
          hintTextField: '••••••••',
          isError: false,
          width: 360,
          obscureText: true,
          textColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        const SizedBox(height: 24),
        Button(
          onPress: onPressButtonLogin,
          text: 'Masuk',
          backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
          textColor: const Color.fromRGBO(255, 255, 255, 1),
          width: 360,
        ),
      ],
    );
  }
}
