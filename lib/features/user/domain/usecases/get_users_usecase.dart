import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_go_rest_app_getx_mvvm/common/usecase/usecase.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/models/user/user.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/repositories/user_repository.dart';

@immutable
class GetUsersUseCase implements UseCase<List<User>, GetUsersParams> {
  final UserRepository userRepository;

  const GetUsersUseCase(this.userRepository);

  @override
  Future<Either<String, List<User>>> call(GetUsersParams params) async {
    return await userRepository.getUsers(
        status: params.status, gender: params.gender);
  }
}

@immutable
class GetUsersParams {
  final String? gender;
  final String? status;

  const GetUsersParams({this.gender, this.status});
}
