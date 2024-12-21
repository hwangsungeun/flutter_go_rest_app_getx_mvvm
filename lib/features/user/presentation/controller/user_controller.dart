import 'package:dartz/dartz.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/controller/base_controller.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/data/models/user/user.dart';
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/usecases/get_users_usecase.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController with StateMixin<List<User>>, BaseController {
  final GetUsersUseCase getUsersUseCase;

  Either<String, List<User>>? failureOrSuccess;

  UserController({
    required this.getUsersUseCase,
  });

  Future<void> getUserList({
    String gender = 'all',
    String status = 'all',
  }) async {
    change(null, status: RxStatus.loading());
    failureOrSuccess = (await getUsersUseCase.call(
      GetUsersParams(status: status, gender: gender),
    ));

    failureOrSuccess!.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (List<User> users) {
        if (users.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(users, status: RxStatus.success());
        }
      },
    );
  }
}
