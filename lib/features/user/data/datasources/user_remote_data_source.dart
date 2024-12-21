
import 'package:flutter_go_rest_app_getx_mvvm/common/network/api_base.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/api_config.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/dio_client.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/models/user/user.dart';

abstract class UserRemoteDataSource {
  Future<List<User>> getUsers({String? gender, String? status});
}

class UserRemoteDataSourceImpl with ApiBase implements UserRemoteDataSource {
  final DioClient dioClient;

  const UserRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<User>> getUsers({String? gender, String? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != 'all') {
      queryParameters.addAll({'gender': gender});
    }

    if (status != null && status != 'all') {
      queryParameters.addAll({'status': status});
    }

    return await makeGetRequest(
      dioClient.get(ApiConfig.users, queryParameters: queryParameters),
      User.fromJson,
    );
  }

  // @override
  // Future<bool> createUser(User user) async {
  //   return await makePostRequest(
  //     dioClient.post(
  //       ApiConfig.users,
  //       data: user,
  //     ),
  //   );
  // }
  //
  // @override
  // Future<bool> updateUser(User user) async {
  //   return await makePutRequest(
  //     dioClient.put(
  //       "${ApiConfig.users}/${user.id}",
  //       data: user,
  //     ),
  //   );
  // }
  //
  // @override
  // Future<bool> deleteUser(User user) async {
  //   return await makeDeleteRequest(
  //     dioClient.delete(
  //       "${ApiConfig.users}/${user.id}",
  //     ),
  //   );
  // }
  //
  // @override
  // Future<List<User>> getUsers({Gender? gender, UserStatus? status}) async {
  //   Map<String, String> queryParameters = <String, String>{};
  //
  //   if (gender != null && gender != Gender.all) {
  //     queryParameters.addAll({'gender': gender.name});
  //   }
  //
  //   if (status != null && status != UserStatus.all) {
  //     queryParameters.addAll({'status': status.name});
  //   }
  //
  //   return await makeGetRequest(
  //     dioClient.get(ApiConfig.users, queryParameters: queryParameters),
  //     User.fromJson,
  //   );
  // }
}
