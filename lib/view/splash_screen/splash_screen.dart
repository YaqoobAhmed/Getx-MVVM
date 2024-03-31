import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/resources/assets/image_assets.dart';
import 'package:getx_nvvm/resources/colors/app_color.dart';
import 'package:getx_nvvm/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_nvvm/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.toastMessage("Yaqoobs App");
          Utils.snackBar("title", "message");
        },
        child: SvgPicture.asset(ImageAssets.houseIcon),
      ),
      // appBar: AppBar(
      //   title: Text('email_hint'.tr),
      // ),
      // body: Image(
      //   image: AssetImage(
      //     ImageAssets.splashScreen,
      //   ),
      // )

      // body: InternetExceptionWidget(
      //   onPressed: () {},
      // ),

      // body: Column(
      //   children: [
      //     RoundButton(
      //       onPressed: () {},
      //       title: "login",
      //       width: 120,
      //     ),
      //     RoundButton(onPressed: () {}, title: "Signup"),
      //   ],
      // ),
      body: Center(
        child: Text(
          "welcome_back".tr,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: AppColor.whitecolor),
        ),
      ),
    );
  }
}
