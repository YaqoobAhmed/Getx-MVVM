import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Utils.toastMessage("Yaqoobs App");
        Utils.snackBar("title", "message");
      }),
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                color: Colors.black,
                height: 200,
                width: 200,
              )
            ],
          )
        ],
      ),
    );
  }
}
