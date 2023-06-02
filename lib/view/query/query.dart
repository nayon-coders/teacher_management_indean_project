import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/rich_text.dart';

import '../../utility/app_const.dart';
import '../../view_controller/app_top_bar.dart';

class Querys extends StatefulWidget {
  const Querys({Key? key}) : super(key: key);

  @override
  State<Querys> createState() => _QuerysState();
}

class _QuerysState extends State<Querys> {
  List tabString = [
    "Parent/students",
    "Staff"
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: DefaultTabController(
          length: tabString.length,
          child: Scaffold(
            backgroundColor: AppColors.bg,
            body: Column(
              children: [
                AppTopBar(size: size, title: "Query", onTap: ()=>Navigator.pop(context)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.white,
                          child: TabBar(
                            unselectedLabelColor: AppColors.textColor,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 0,
                            indicatorColor: Colors.white,
                            labelPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                            indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: AppColors.mainColor,
                            ),

                            tabs: [
                              for(var i = 0; i<tabString.length; i++)
                                Tab(
                                  child: SizedBox(
                                    //width: 70,
                                    child: Text("${tabString[i]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: normalFontSize,

                                      ),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                          child: TabBarView(
                            physics: ScrollPhysics(),
                            children: [
                              for(var i=0; i<tabString.length; i++)
                                ListView(
                                  children: [
                                    for(var i=0; i<10; i++)
                                      Container(
                                        width: size.width,
                                        // height: 200,
                                        margin: EdgeInsets.only(bottom: 0),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                        //  color: AppColors.white,
                                        //  borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${i+1}. Query",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: titleFontSize
                                              ),
                                            ),
                                            SizedBox(height: 7,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichTextWidget(leftText: "Name: ", rightText: "Nayon"),
                                                  SizedBox(width: 2,),
                                                  RichTextWidget(leftText: "Class: ", rightText: "VII"),
                                                  SizedBox(width: 2,),
                                                  RichTextWidget(leftText: "Section: ", rightText: "3"),
                                                  SizedBox(width: 2,),
                                                  RichTextWidget(leftText: "Sub: ", rightText: "Math"),
                                                  SizedBox(width: 2,),
                                                  RichTextWidget(leftText: "Time: ", rightText: "3 Days"),
                                                  SizedBox(width: 2,),
                                                ],
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: size.width,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1, color: AppColors.borderColor)
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width:size.width*.69,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                                      child: Text("Et nec tantas accusamus salutatus, sit commodo veritus te, erat  fabulas has ut. Rebum  cum laudem cum ea,  ",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: normalFontSize
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 13 ,),
                                                  Container(
                                                    width: size.width*.15,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.mainColor
                                                    ),
                                                    child: Center(
                                                      child: Icon(Icons.arrow_right_outlined, color: AppColors.white, size: 25,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                )
                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
