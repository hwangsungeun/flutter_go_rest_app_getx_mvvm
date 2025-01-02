import 'package:flutter_go_rest_app_getx_mvvm/core/api_config.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/api_helper.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/network/dio_client.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/model/user/user.dart';

class UserApi with ApiHelper {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<List<User>> getUsers({String? gender, String? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != 'all') {
      queryParameters.addAll({'gender': gender});
    }

    if (status != null && status != 'all') {
      queryParameters.addAll({'status': status});
    }

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.users, queryParameters: queryParameters),
        User.fromJson);
  }
}
