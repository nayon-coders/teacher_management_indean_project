import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';

import '../utility/colors.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.leftTextSize = 12.00,
    this.rightTextSize = 14.00,
    this.rightTextColor = AppColors.textColor,
    this.leftTextColor = AppColors.textColor,
  }) : super(key: key);
  final String leftText;
  final String rightText;
  final double leftTextSize;
  final double rightTextSize;
  final Color rightTextColor;
  final Color leftTextColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:TextSpan(
          children: [
            TextSpan(
                text: "$leftText ",
                style: TextStyle(
                    fontSize: leftTextSize,
                    fontWeight: FontWeight.w400,
                    color: leftTextColor
                )
            ),
            TextSpan(
                text: "$rightText",
                style: TextStyle(
                    fontSize: rightTextSize,
                    fontWeight: FontWeight.w600,
                    color: rightTextColor
                )
            )
          ]
      ),
    );
  }
}
