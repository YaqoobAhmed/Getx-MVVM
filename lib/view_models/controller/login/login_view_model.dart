import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/models/login/user_model.dart';
import 'package:getx_nvvm/repository/login_repository/login_repository.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/utils/utils.dart';
import 'package:getx_nvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() {
    isLoading.value = true;
    Map data = {
      "email": emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value) {
      isLoading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar("Login", value['error']);
      } else {
        userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
          Get.toNamed(RoutesName.homeView);
        }).onError((error, stackTrace) {});
        Utils.snackBar("Login", "Login Successfully");
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
