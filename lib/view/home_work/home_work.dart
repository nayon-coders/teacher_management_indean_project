import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/rich_text.dart';

import '../../view_controller/app_input.dart';
import '../../view_controller/app_top_bar.dart';

class HomeWork extends StatefulWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {

  List classList= [
    "Class I",
    "Class II",
    "Class III",
    "Class IV",
    "Class V",
    "Class VI",
    "Class VII",
    "Class VIII",
  ];

  final attachMent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: DefaultTabController(
          length: classList.length,
          child: Scaffold(
            backgroundColor: AppColors.bg,
            body: Column(
              children: [
                AppTopBar(size: size, title: "Home Work", onTap: ()=>Navigator.pop(context)),
                SizedBox(height: 5,),
                TabBar(
                  unselectedLabelColor: AppColors.textColor,
                    isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),

                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.mainColor,
                  ),
                  
                  tabs: [
                    for(var i = 0; i<classList.length; i++)
                      Tab(
                        child: SizedBox(
                         //width: 70,
                          child: Text("${classList[i]}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: normalFontSize,

                            ),
                          ),
                        ),
                      ),

                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: TabBarView(
                    physics: ScrollPhysics(),
                    children: [
                      for(var i=0; i<classList.length; i++)
                        ListView(
                          children: [
                            for(var i=0; i<classList.length; i++)
                              Container(
                              width: size.width,
                             // height: 200,
                              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichTextWidget(leftText: "Subject: ", rightText: "Mathematics"),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.edit_outlined, color: AppColors.mainColor,),
                                          ),
                                          IconButton(
                                            onPressed: (){},
                                            icon: Icon(Icons.delete_outline_outlined, color: AppColors.red,),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Row(
                                    children: [
                                      RichTextWidget(leftText: "Section: ", rightText: "4"),
                                      SizedBox(width: 15,),
                                      RichTextWidget(leftText: "Date: ", rightText: "20/05/2023"),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: size.width,
                                    padding: EdgeInsets.all(10),
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.grey.shade300)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Home work details",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: normalFontSize,
                                          ),
                                        ),
                                        SizedBox(height: 7,),
                                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been type the industry's standard dummy text when an unknown printer took .",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: normalFontSize,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  AppInput(
                                    controller: attachMent,
                                    hintText: "View attached file",
                                    title: "",
                                    titleMargin: 0,
                                    isReadOnly: true,
                                    isSuffix: true,
                                    suFixIcon:  Icons.file_copy_outlined,
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
        ),
      ),
    );
  }
}
