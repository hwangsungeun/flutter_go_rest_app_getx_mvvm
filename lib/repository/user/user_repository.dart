import 'package:dartz/dartz.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/repository/repository_helper.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/api/user/user_api.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/model/user/user.dart';

class UserRepository with RepositoryHelper<User> {
  final UserApi userApi;

  UserRepository({required this.userApi});

  Future<Either<String, List<User>>> getUsers({String? gender, String? status}) async {
    return checkItemsFailOrSuccess(userApi.getUsers(gender: gender, status: status));
  }

}
