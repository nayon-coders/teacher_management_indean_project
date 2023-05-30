import 'package:flutter/material.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_input.dart';
import 'package:teachs/view_controller/app_top_bar.dart';
import 'package:teachs/view_controller/rich_text.dart';

import '../../utility/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(

          children: [
            //user profile
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 20),
              height: 400,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),
              child: Stack(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed:()=>Navigator.pop(context),
                          icon: Icon(Icons.arrow_back, color: AppColors.white,)
                      ),
                      SizedBox(width: size.width*.25,),
                      Text("User Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: size.width,
                      height: 260,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          Container(
                            transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/images/profile.png", height: 80, width: 80, fit: BoxFit.cover,),
                            ),
                          ),

                          //edit profile button
                          InkWell(
                            onTap: ()=>showEditPopup(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Nayon Talukder",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.edit_outlined, color: AppColors.mainColor,
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 4,),
                          //phone
                          RichTextWidget(
                              leftText: "Phone Number:",
                              rightText: " +88018 37473958"
                          ),
                          SizedBox(height: 4,),
                          //phone
                          RichTextWidget(
                              leftText: "Email: ",
                              rightText: "nayon.coders@gmail.com"
                          ),
                          SizedBox(height: 20,),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.only(left: 10, right: 10,top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width*.20,
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Column(
                                    children: [
                                      Text("TeacherID"),
                                      SizedBox(height: 6),
                                      Text("AJF907J79",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  color: Colors.grey,
                                ),


                                Container(
                                  width: size.width*.45,
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("School Name:"),
                                      SizedBox(height: 6),
                                      Text("Nadmulla Secoundry school.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 30,
                                  color: Colors.grey,
                                ),


                                Container(
                                  width: size.width*.20,
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: Column(
                                    children: [
                                      Text("Join Date:"),
                                      SizedBox(height: 6),
                                      Text("12 Jun 23",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today`s class overview  ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildOverViewMethod(
                          size: size,
                        height: 100,
                        count: "06",
                        countColor: Color(0xff4E35D4),
                        title: "Total Class"
                      ),
                      buildOverViewMethod(
                          size: size,
                          height: 100,
                          count: "04",
                          countColor: Color(0xff00B132),
                          title: "Complete"
                      ),
                      buildOverViewMethod(
                          size: size,
                          height: 100,
                          count: "02",
                          countColor: Color(0xffFF0000),
                          title: "uncomplete"
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("Leave overview  ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildOverViewMethod(
                          size: size,
                          height: 100,
                          count: "10",
                          countColor: Color(0xff4E35D4),
                          title: "Total yearly have"
                      ),
                      buildOverViewMethod(
                          size: size,
                          height: 100,
                          count: "08",
                          countColor: Color(0xff00B132),
                          title: "Spend leave"
                      ),
                      buildOverViewMethod(
                          size: size,
                          height: 100,
                          count: "02",
                          countColor: Color(0xffFF0000),
                          title: "Leave in hand"
                      )
                    ],
                  )


                ],
              ),
            )



          ],
        ),
      ),
    ));
  }

  Container buildOverViewMethod({

  required Size size,
    required double height,
    required String title,
    required String count,
    required Color countColor,
}) {
    return Container(
                      width: size.width*.28,
                      height: height,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(0,2),
                            blurRadius: 5,
                            spreadRadius: 2
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("$title",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black54
                            ),
                          ),
                          Text("$count",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: countColor
                            ),
                          )
                        ],
                      ),
                    );
  }

  Future<void> showEditPopup() async{
    var size = MediaQuery.of(context).size;

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return Container(
            width: size.width,
            child: AlertDialog(
                titlePadding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
              insetPadding: EdgeInsets.all(20),
              iconPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,

              title:  Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.cancel), color: AppColors.mainColor,)),
              content:  SingleChildScrollView(
                child: Form(
                  child: ListBody(
                    children: <Widget>[
                      AppInput(
                          controller: name,
                          hintText: "Type full Name",
                          title: "Full Name"
                      ),
                      SizedBox(height: 20,),
                      AppInput(
                          controller: email,
                          hintText: "Type email address",
                          title: "Email Name"
                      ),
                      SizedBox(height: 20,),
                      AppInput(
                          controller: email,
                          hintText: "Type phone no",
                          title: "Phone No"
                      ),
                      SizedBox(height: 30,),
                      AppButton(
                          width: size.width,
                          height: 50,
                          onClick: (){},
                          title: "Update"),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),

            ),
          );
        },
      );

  }
}
