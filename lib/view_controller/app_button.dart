import 'package:flutter/material.dart';

import '../utility/app_const.dart';
import '../utility/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.width, required this.height, required this.onClick, required this.title
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor
        ),
        child: Center(
          child: Text("$title",
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: bigTitleFontSize
            ),
          ),
        ),
      ),
    );
  }
}
