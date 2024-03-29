import 'package:flutter/material.dart';
import 'package:getx_nvvm/resources/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.buttonColor = AppColor.primaryButtonColor,
      this.textColor = AppColor.primeryTextcolorWhite,
      this.height = 44,
      this.width = 150,
      this.isLoading = false,
      required this.onPressed,
      required this.title});
  final String title;
  final double height, width;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(50)),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColor.primeryTextcolorWhite),
            )),
    );
  }
}
