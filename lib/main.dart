import 'package:flutter/material.dart';
import 'package:flutter_go_rest_app_getx_mvvm/app.dart';
import 'package:flutter_go_rest_app_getx_mvvm/di.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initializeDateFormatting().then((_) => runApp(const App()));
}