import 'package:dio/dio.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/dio_client.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/api/user/user_api.dart';
import 'package:flutter_go_rest_app_getx_mvvm/repository/user/user_repository.dart';
import 'package:flutter_go_rest_app_getx_mvvm/viewmodel/user/controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

init() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  // User api
  getIt.registerLazySingleton<UserApi>(
          () => UserApi(dioClient: getIt<DioClient>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
        () => UserRepository(userApi: getIt<UserApi>()),
  );

  //UserController
  getIt.registerFactory(
        () => UserController(userRepository: getIt<UserRepository>()),
  );
}