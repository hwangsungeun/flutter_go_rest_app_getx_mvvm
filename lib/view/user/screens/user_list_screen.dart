import 'package:flutter/material.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/dialog/retry_dialog.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/widget/empty_widget.dart';
import 'package:flutter_go_rest_app_getx_mvvm/common/widget/spinkit_indicator.dart';
import 'package:flutter_go_rest_app_getx_mvvm/core/app_asset.dart';
import 'package:flutter_go_rest_app_getx_mvvm/core/app_style.dart';
import 'package:flutter_go_rest_app_getx_mvvm/data/model/user/user.dart';
import 'package:flutter_go_rest_app_getx_mvvm/di.dart';
import 'package:flutter_go_rest_app_getx_mvvm/viewmodel/user/controller/user_controller.dart';
import 'package:get/get.dart';

enum UserOperation { edit, delete, post, todo }

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController controller = getIt<UserController>();

  PreferredSizeWidget get _appBar {
    return AppBar(
      leading: IconButton(
        onPressed: controller.getUserList,
        icon: const Icon(Icons.refresh),
      ),
      // actions: [
      //   PopupMenu<UserStatus>(
      //     icon: Icons.filter_list_outlined,
      //     items: UserStatus.values,
      //     onChanged: (UserStatus value) {
      //       controller.getUserList(status: value);
      //     },
      //   ),
      //   PopupMenu<Gender>(
      //     icon: Icons.filter_alt_outlined,
      //     items: Gender.values,
      //     onChanged: (Gender value) => controller.getUserList(gender: value),
      //   )
      // ],
      title: const Text("Users"),
    );
  }

  // Widget get floatingActionButton {
  //   return FloatingActionButton(
  //     onPressed: () async {
  //       late User user;
  //       bool isCreate = await createDialog(
  //         context: context,
  //         userData: (User userValue) => user = userValue,
  //       );
  //
  //       if (isCreate) {
  //         controller.createUser(user);
  //         if (!mounted) return;
  //         showDialog(
  //           context: context,
  //           builder: (_) {
  //             return Obx(
  //               () {
  //                 return AsyncWidget(
  //                   apiState: controller.apiStatus.value,
  //                   progressStatusTitle: "Creating user...",
  //                   failureStatusTitle: controller.errorMessage.value,
  //                   successStatusTitle: "Successfully created",
  //                   onRetryPressed: () => controller.getUserList(),
  //                   onSuccessPressed: () {
  //                     Navigator.pop(context);
  //                     controller.getUserList();
  //                   },
  //                 );
  //               },
  //             );
  //           },
  //         );
  //       }
  //     },
  //     child: const Icon(Icons.add),
  //   );
  // }

  Widget userListItem(User user) {
    return Card(
      child: Row(
        children: [
          Image.asset(user.gender == 'male' ? AppAsset.male : AppAsset.female, height: 75),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: headLine4),
                const SizedBox(height: 10),
                Text(user.email, style: headLine6)
              ],
            ),
          ),
          const SizedBox(width: 15),
          // StatusContainer(status: user.status),
          // PopupMenu<UserOperation>(
          //   items: UserOperation.values,
          //   onChanged: (UserOperation value) async {
          //     switch (value) {
          //       case UserOperation.post:
          //         navigateTo(PostListScreen(user: user));
          //         break;
          //       case UserOperation.todo:
          //         navigateTo(ToDoListScreen(user: user));
          //         break;
          //       case UserOperation.delete:
          //         deleteUser(user);
          //         break;
          //       case UserOperation.edit:
          //         editUser(user);
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  // void deleteUser(User user) async {
  //   bool isAccepted = await deleteDialog(context);
  //   if (isAccepted) {
  //     controller.deleteUser(user);
  //     if (!mounted) return;
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return Obx(
  //           () {
  //             return AsyncWidget(
  //               apiState: controller.apiStatus.value,
  //               progressStatusTitle: "Deleting user...",
  //               failureStatusTitle: controller.errorMessage.value,
  //               successStatusTitle: "Successfully deleted",
  //               onRetryPressed: () => controller.deleteUser(user),
  //               onSuccessPressed: () {
  //                 Navigator.pop(context);
  //                 controller.getUserList();
  //               },
  //             );
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  // void editUser(User user) async {
  //   late User userObj;
  //   bool isUpdate = await createDialog(
  //     user: user,
  //     type: Type.update,
  //     context: context,
  //     userData: (User userValue) {
  //       userObj = userValue;
  //     },
  //   );
  //
  //   if (isUpdate) {
  //     controller.updateUser(userObj);
  //     if (!mounted) return;
  //     showDialog(
  //       context: context,
  //       builder: (_) {
  //         return Obx(
  //           () {
  //             return AsyncWidget(
  //               apiState: controller.apiStatus.value,
  //               progressStatusTitle: "Updating user...",
  //               failureStatusTitle: controller.errorMessage.value,
  //               successStatusTitle: "Successfully updated",
  //               onRetryPressed: () => controller.updateUser(userObj),
  //               onSuccessPressed: () {
  //                 Navigator.pop(context);
  //                 controller.getUserList();
  //               },
  //             );
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  void initState() {
    controller.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: floatingActionButton,
      appBar: _appBar,
      body: controller.obx(
        (state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state?.length,
          itemBuilder: (_, index) {
            User user = state![index];
            return userListItem(user).marginSymmetric(horizontal: 10);
          },
        ),
        onLoading: const SpinKitIndicator(type: SpinKitType.circle),
        onError: (error) => RetryDialog(
          title: "$error",
          onRetryPressed: () => controller.getUserList(),
        ),
        onEmpty: const EmptyWidget(message: "No user!"),
      ),
    );
  }
}
