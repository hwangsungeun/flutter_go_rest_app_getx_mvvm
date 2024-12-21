import 'package:dio/dio.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/dio_client.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/datasources/user_remote_data_source.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/repositories/user_repository.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/presentation/controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

init() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  //UserController
  getIt.registerFactory(
        () => UserController(
      getUsersUseCase: getIt<GetUsersUseCase>(),
    ),
  );

  // User Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt<UserRepository>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(remoteDataSource: getIt()),
  );

  // User remote data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(dioClient: getIt<DioClient>()),
  );
}