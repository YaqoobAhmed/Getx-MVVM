import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then((value) {
      print(value.token);
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RoutesName.homeView));
      }
    });
  }
}
