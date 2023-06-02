import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';

import '../../utility/app_const.dart';
import '../../view_controller/app_input.dart';
import '../../view_controller/app_top_bar.dart';
import '../../view_controller/rich_text.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {

  final List<String>  reviewsList= [
    'Admin reviews',
    'Parent/students reviews',
    'Staff reviews',
    'Student reviews',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: DefaultTabController(
          length: reviewsList.length,
          child: Scaffold(
            backgroundColor: AppColors.bg,
            body: Column(
              children: [
                AppTopBar(size: size, title: "Reviews", onTap: ()=>Navigator.pop(context)),
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
                    borderRadius: BorderRadius.circular(0),
                    color: AppColors.mainColor,
                  ),

                  tabs: [
                    for(var i = 0; i<reviewsList.length; i++)
                      Tab(
                        child: SizedBox(
                          //width: 70,
                          child: Text("${reviewsList[i]}",
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
                      for(var i=0; i<reviewsList.length; i++)
                        ListView(
                          children: [
                            for(var i=0; i<reviewsList.length; i++)
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
                                     children: [
                                       SizedBox(
                                         width: 50,
                                         height: 50,
                                         child: ClipRRect(
                                           borderRadius: BorderRadius.circular(100),
                                           child: Image.asset("assets/images/profile.png", fit: BoxFit.cover,),
                                         ),
                                       ),
                                       SizedBox(width: 10,),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Row(
                                             children: [
                                               Icon(Icons.star,size: 20,color: Colors.amber,),
                                               Icon(Icons.star,size: 20,color: Colors.amber,),
                                               Icon(Icons.star,size: 20,color: Colors.amber,),
                                               Icon(Icons.star,size: 20,color: Colors.amber,),
                                               Icon(Icons.star,size: 20,color: Colors.amber,)
                                             ],
                                           ),
                                           SizedBox(height: 5,),
                                           Row(
                                             children: [
                                               Text("Nayon Taluder",
                                                 style: TextStyle(
                                                     fontSize: normalFontSize,
                                                     fontWeight: FontWeight.w600
                                                 ),
                                               ), 
                                               SizedBox(width: 10,), 
                                               RichTextWidget(leftText: "Class: ", rightText: "VII"),
                                               SizedBox(width: 5,),
                                               RichTextWidget(leftText: "Section: ", rightText: "3"),
                                             ],
                                           )


                                         ],
                                       )
                                     ],
                                   ),

                                    SizedBox(height: 10,),
                                    Text("Et nec tantas accusamus salutatus, sit commodo veritus te, erat  fabulas has ut. Rebum  cum laudem cum ea,  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: normalFontSize
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Align(alignment: Alignment.centerRight, child: RichTextWidget(leftText: "Time: ", rightText: "1 hours ago"))
                                   
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
