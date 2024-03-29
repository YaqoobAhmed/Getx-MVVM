import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/resources/colors/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const GeneralExceptionWidget({super.key, required this.onPressed});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * .15,
          ),
          Icon(
            Icons.cloud_off,
            color: AppColor.iconColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                "general_exception".tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: height * .15,
          ),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: 44,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.primaryColor,
              ),
              child: Center(
                  child: Text(
                'Retry',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColor.primeryTextcolorWhite),
              )),
            ),
          )
        ],
      ),
    );
  }
}
