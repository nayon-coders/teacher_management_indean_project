import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';

import '../../view_controller/app_top_bar.dart';
import '../../view_controller/rich_text.dart';

class ClassScheduleList extends StatefulWidget {
  const ClassScheduleList({Key? key}) : super(key: key);

  @override
  State<ClassScheduleList> createState() => _ClassScheduleListState();
}

class _ClassScheduleListState extends State<ClassScheduleList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: SingleChildScrollView(
          child: Column(

            children: [
              AppTopBar(
                  size: size,
                title: "Class Schedule",
                onTap: ()=>Navigator.pop(context),
              ),

              //body
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Search schedule by date ",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width,
                      height: 50,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppColors.borderColor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pick a date",
                            style: TextStyle(
                              fontSize: normalFontSize,
                              color: Colors.grey
                            ),
                          ),
                          Icon(Icons.calendar_month_outlined, color: Colors.black54,)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(
                      height: 170 *10 ,
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (_, index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: size.width,
                            height: 160,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Container(
                                  width: size.width,
                                  height: 130,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Color(0xffD5CDFF))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichTextWidget(
                                            leftText: "Subject: ",
                                            rightText: "Math",
                                          ),
                                          RichTextWidget(
                                            leftText: "Time: ",
                                            rightText: "8.00 am-9.00 am",
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 4,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichTextWidget(
                                            leftText: "Class: ",
                                            rightText: "V",
                                          ),
                                          SizedBox(width: 8,),
                                          RichTextWidget(
                                            leftText: "Section: ",
                                            rightText: "B",
                                          )
                                        ],
                                      ),

                                      SizedBox(height: 4,),
                                      RichTextWidget(
                                        leftText: "Topics: ",
                                        rightText: "Classification of present tense & use.",
                                      ),
                                      SizedBox(height: 4,),
                                      RichTextWidget(
                                        leftText: "Status: ",
                                        rightText: "Ongoing",
                                        rightTextColor: AppColors.red,
                                      ),
                                    ],
                                  ),
                                ),


                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 1, color: Color(0xffD5CDFF))
                                    ),
                                    child: Center(child: Text("Period-4",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: normalFontSize
                                      ),
                                    ),),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

