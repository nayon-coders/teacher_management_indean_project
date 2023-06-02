import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view/assignment/create_assignment.dart';
import 'package:teachs/view/home_work/home_work.dart';
import 'package:teachs/view/index.dart';
import 'package:teachs/view/profile/profile.dart';
import 'package:teachs/view/query/query.dart';
import 'package:teachs/view/reviews/reviews.dart';
import 'package:teachs/view/syllabus/syllabus.dart';

import '../../utility/app_const.dart';
import '../../view_controller/app_drawer.dart';
import '../../view_controller/app_iconButton.dart';
import '../../view_controller/rich_text.dart';
import '../attendance/ptm-attendance/ptm_attendance.dart';
import '../attendance/student/student_attendace.dart';
import '../attendance/teacher/teacher-attendnace.dart';
import '../class_scehdule/class_schedule_list.dart';
import '../poll/poll.dart';
import '../test/test.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: AppDrawer(scaffoldKey: scaffoldKey),
        backgroundColor: AppColors.bg,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //top section
              Container(
                width: size.width,
                height: 230,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill,
                  )
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap:(){
                                scaffoldKey.currentState?.openDrawer();
                            },
                            child: Image.asset("assets/icons/menu.png", height: 25, width: 25, fit: BoxFit.fill,)),
                        Text("Dashboard",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: bigTitleFontSize,
                            color: AppColors.white
                          ),
                        ),

                        Stack(
                          children: [
                            Icon(Icons.notifications, size: 30,color: AppColors.white,),
                            Positioned(
                              right: 0, top: 0,
                              child: Container(
                                width: 15, height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child:  Center(child: Text('10',
                                  style: TextStyle(
                                    color: AppColors.white,
                                      fontSize: smallFontSize
                                  ),
                                ),),
                              ),
                            )
                          ],
                        ),

                      ],
                    ),

                    //SizedBox(height: 20,),
                    Positioned(
                      top: size.height*.10,
                      child: InkWell(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/images/profile.png", height: 55, width: 55, fit: BoxFit.cover,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nayon Talukder",
                                  style: TextStyle(
                                      fontSize: bigTitleFontSize,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white
                                  ),
                                ),
                                SizedBox(height: 7,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: size.width*.50,
                                      child: Text("St. Mary’s Sr. Sec. School",
                                        style: TextStyle(
                                            fontSize:normalFontSize,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width*.30,
                                      child: Text("28 April, 23",
                                        style: TextStyle(
                                            fontSize: normalFontSize,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 00, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //time schedule
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today`s schedule",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: bigTitleFontSize,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Index(currentPage: 1,)));
                          },
                          child: Row(
                            children: [
                              Text("SEE ALL",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: titleFontSize,
                                  color: AppColors.mainColor
                                ),
                              ),
                              Icon(Icons.arrow_forward, color: AppColors.mainColor,)
                            ],
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 20,),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index){
                          return Container(
                            width: 200,
                            height: 150,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(

                              children: [
                                Container(
                                  width: 200,
                                  height: 140,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Color(0xffD5CDFF))
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichTextWidget(
                                        leftText: "Subject: ",
                                        rightText: "Math",
                                      ),
                                      SizedBox(height: 4,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
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
                                        leftText: "Time: ",
                                        rightText: "8.00 am-9.00 am",
                                      ),
                                      SizedBox(height: 4,),
                                      RichTextWidget(
                                        leftText: "Topics: ",
                                        rightText: "Al-zebra",
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
                                Container(
                                  width: 80,
                                  height: 33,
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
                              ],
                            ),
                          );
                        },
                      ),
                    ),


                    //attendance overview
                    SizedBox(height: 10,),
                    Text("Attendance overview",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: bigTitleFontSize,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width,
                      height: 140,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemButtonWidget(
                                image: "assets/icons/teacher-attend.png",
                                title: "Teacher",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherAttendance())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/student-attend.png",
                                title: "Students",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAttendance())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/ptm-attend.png",
                                title: "PTM Days",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PTMAttendance())),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),



                    //Student activity
                    SizedBox(height: 15,),
                    Text("Student Activity",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: bigTitleFontSize,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width,
                      height: 140,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemButtonWidget(
                                image: "assets/icons/exam.png",
                                title: "Test",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Test())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/home-w.png",
                                title: "Home Work",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeWork())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/syllabus.png",
                                title: "Syllabus",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Syllabus())),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),



                    //Student activity
                    SizedBox(height: 15,),
                    Text("My feed",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: bigTitleFontSize,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width,
                      height: 140,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemButtonWidget(
                                image: "assets/icons/review.png",
                                title: "Reviews",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Reviews())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/query.png",
                                title: "Query",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Querys())),
                              ),
                              ItemButtonWidget(
                                image: "assets/icons/poll.png",
                                title: "Poll",
                                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Poll())),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),



                    //Assignment
                    SizedBox(height: 15,),
                    Text("Assignment",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: bigTitleFontSize,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width*.43,
                          height: 140,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                          ),
                          child:  ItemButtonWidget(
                            image: "assets/icons/create-assignment.png",
                            title: "Create Assignment",
                            onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAssignment())),
                          ),
                        ),
                        Container(
                          width: size.width*.43,
                          height: 140,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                          ),
                          child:  ItemButtonWidget(
                            image: "assets/icons/view-assignment.png",
                            title: "View Assignment",
                            onClick: (){},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30,),
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



