import 'package:dio/dio.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

init() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
}