import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/screens/home/index.dart';
import 'package:mainventori/screens/login/index.dart';
import 'package:mainventori/store/index.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1920, 1080));
  }

  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userStore);

    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: userData.user != null ? HomeScreen() : const LoginScreen(),
      builder: FlutterSmartDialog.init(),
    );
  }
}
