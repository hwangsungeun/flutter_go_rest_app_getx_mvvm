import 'package:dartz/dartz.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/repository/repository_helper.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/datasources/user_remote_data_source.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/models/user/user.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository with RepositoryHelper<User> {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<User>>> getUsers({String? gender, String? status}) {
    return checkItemsFailOrSuccess(remoteDataSource.getUsers(gender: gender, status: status));
  }
}
