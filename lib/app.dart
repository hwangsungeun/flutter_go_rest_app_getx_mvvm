import 'package:flutter/material.dart';
import 'package:flutter_go_rest_app_getx_mvvm/core/app_theme.dart';
import 'package:flutter_go_rest_app_getx_mvvm/view/user/screens/user_list_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightAppTheme,
      home: const UserListScreen(),
    );
  }
}
