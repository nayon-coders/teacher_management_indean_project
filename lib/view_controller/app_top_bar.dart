import 'package:flutter/material.dart';

import '../utility/colors.dart';
class AppTopBar extends StatelessWidget {
  const AppTopBar({
    Key? key,
    required this.size, required this.title, required this.onTap,
  }) : super(key: key);

  final Size size;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.only(bottom: 20),
      height: 70,
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width*.10,
            child: IconButton(
                onPressed:onTap,
                icon: Icon(Icons.arrow_back, color: AppColors.white,)
            ),
          ),
          SizedBox(
            width: size.width*.70,
            child: Center(
              child: Text("$title",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: size.width*.10,)
        ],
      ),
    );
  }
}
