import 'package:flutter_go_rest_app_getx_mvvm/common/controller/base_controller.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/model/user/user.dart';
import 'package:flutter_go_rest_app_getx_mvvm/repository/user/user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin<List<User>>, BaseController {
  final UserRepository userRepository;

  UserController({required this.userRepository});

  Future<void> getUserList({
    String gender = 'all',
    String status = 'all',
  }) async {
    change(null, status: RxStatus.loading());
    Either<String, List<User>> failureOrSuccess =
    (await userRepository.getUsers(gender: gender, status: status));

    failureOrSuccess.fold(
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
