import 'package:dartz/dartz.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/models/user/user.dart';

abstract class UserRepository {
  Future<Either<String, List<User>>> getUsers({String? gender, String? status});
}