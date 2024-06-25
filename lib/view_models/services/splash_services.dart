import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then((value) {
      print('token ${value.token}');
      print('isLogin ${value.isLogin}');
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Get.toNamed(RoutesName.loginView);
      } else {
        Get.toNamed(RoutesName.homeView);
      }
    });
  }
}
