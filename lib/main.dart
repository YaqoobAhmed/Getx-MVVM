import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/resources/localization/app_localization.dart';
import 'package:getx_nvvm/resources/routes/routes.dart';
import 'package:getx_nvvm/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Locale('en_US'),
      fallbackLocale: Locale('en_US'),
      title: 'Flutter Demo',
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
