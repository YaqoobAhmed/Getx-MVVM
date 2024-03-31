import 'package:get/get.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/view/login/login_view.dart';
import 'package:getx_nvvm/view/splash_screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashscreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 500),
            transition: Transition.circularReveal),
        GetPage(
            name: RoutesName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(seconds: 2),
            transition: Transition.fadeIn),
      ];
}
