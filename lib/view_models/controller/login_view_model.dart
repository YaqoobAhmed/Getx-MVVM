import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/repository/login_repository/login_repository.dart';
import 'package:getx_nvvm/utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

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
        Utils.snackBar("Login", "Login Successfully");
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
