import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';

import '../../view_controller/app_top_bar.dart';

class TestUploadAnswer extends StatefulWidget {
  const TestUploadAnswer({Key? key}) : super(key: key);

  @override
  State<TestUploadAnswer> createState() => _TestUploadAnswerState();
}

class _TestUploadAnswerState extends State<TestUploadAnswer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: Column(
            children: [
              AppTopBar(size: size, title: "PTM Attendance", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: ListView(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
