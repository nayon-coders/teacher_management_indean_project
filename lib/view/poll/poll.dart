import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/rich_text.dart';

import '../../view_controller/app_top_bar.dart';

class Poll extends StatefulWidget {
  const Poll({Key? key}) : super(key: key);

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
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
              AppTopBar(size: size, title: "Poll", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                  child: ListView(
                    children: [
                      buildItems(size),
                      buildItems(size),
                      buildItems(size),
                      buildItems(size),
                      buildItems(size),
                      buildItems(size),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildItems(Size size) {
    return Container(
        width: size.width,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Why do you want to work in our school?",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: titleFontSize,
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                RichTextWidget(leftText: "Admin: ", rightText: "Suchi Gosh"),
                SizedBox(width: 10,),
                RichTextWidget(leftText: "1h 30 min ago", rightText: ""),
              ],
            ),
            SizedBox(height: 30,),

            Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor, width: 1)
              ),
              child: Center(
                child:  Text("A. Lorem Ipsum is simply dummy",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                    color: Color(0xff768396)
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderColor, width: 1)
              ),
              child: Center(
                child:  Text("B. Lorem Ipsum is simply dummy",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: titleFontSize,
                      color: AppColors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderColor, width: 1)
              ),
              child: Center(
                child:  Text("C. Lorem Ipsum is simply dummy",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: titleFontSize,
                      color: Color(0xff768396)
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerRight,
              child: Text("1.5K  votes",
                style: TextStyle(
                  fontSize: normalFontSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(height: 1, color: Colors.grey,),
            SizedBox(height: 30,),
            Text("Voting result",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: titleFontSize,
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: size.width*.27,
                    height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: AppColors.borderColor)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("A",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: bigTitleFontSize,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("456",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: AppColors.mainColor
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                    width: size.width*.27,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppColors.borderColor)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("A",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: bigTitleFontSize,
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("456",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.mainColor
                          ),
                        ),
                      ],
                    )
                ),
                Container(
                    width: size.width*.27,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppColors.borderColor)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("A",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: bigTitleFontSize,
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("456",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: AppColors.mainColor
                          ),
                        ),
                      ],
                    )
                ),
              ],
            )
          ],
        ),
      );
  }
}
