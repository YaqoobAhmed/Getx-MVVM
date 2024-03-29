import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/resources/assets/image_assets.dart';
import 'package:getx_nvvm/resources/components/round_button.dart';
import 'package:getx_nvvm/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.toastMessage("Yaqoobs App");
          Utils.snackBar("title", "message");
        },
        child: SvgPicture.asset(ImageAssets.houseIcon),
      ),
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      // body: Image(
      //   image: AssetImage(
      //     ImageAssets.splashScreen,
      //   ),
      // )

      // body: InternetExceptionWidget(
      //   onPressed: () {},
      // ),

      body: Column(
        children: [
          RoundButton(
            onPressed: () {},
            title: "login",
            width: 120,
          ),
          RoundButton(onPressed: () {}, title: "Signup"),
        ],
      ),
    );
  }
}
