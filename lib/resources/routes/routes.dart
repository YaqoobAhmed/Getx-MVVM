import 'package:get/get.dart';
import 'package:getx_nvvm/resources/routes/routes_name.dart';
import 'package:getx_nvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.splashscreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 50),
            transition: Transition.circularReveal),
      ];
}
