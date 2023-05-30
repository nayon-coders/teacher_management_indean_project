import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view/test/create_test.dart';
import 'package:teachs/view/test/notify_parents.dart';
import 'package:teachs/view/test/test_result.dart';
import 'package:teachs/view/test/upload_answer.dart';
import 'package:teachs/view_controller/app_iconButton.dart';
import 'package:teachs/view_controller/app_top_bar.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
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
              AppTopBar(size: size, title: "Test", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: ListView(
                  children: [

                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*.40,
                                child: ItemButtonWidget(
                                    title: "Notify Parents",
                                    onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NotifyParents())),
                                    image: "assets/icons/notify_parents.png"
                                )
                              ),
                              SizedBox(
                                  width: size.width*.40,
                                  child: ItemButtonWidget(
                                      title: "Upload answer sheets",
                                      onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TestUploadAnswer())),
                                      image: "assets/icons/upload-ans-sheet.png"
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: size.width*.40,
                                  child: ItemButtonWidget(
                                      title: "Create Test",
                                      onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTest())),
                                      image: "assets/icons/create-test.png"
                                  )
                              ),
                              SizedBox(
                                  width: size.width*.40,
                                  child: ItemButtonWidget(
                                      title: "Test Result",
                                      onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TestResult())),
                                      image: "assets/icons/test-result.png"
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    )

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
