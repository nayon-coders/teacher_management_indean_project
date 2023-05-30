import 'package:flutter/material.dart';

import '../utility/colors.dart';
class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({
    Key? key,
    required this.title,
    required this.onClick,
    required this.image,
  }) : super(key: key);
  final String title;
  final VoidCallback onClick;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(100)
            ),
            child: Image.asset(image,
              height: 40, width: 40,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5,),
          Text("$title",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}
