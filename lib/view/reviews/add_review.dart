import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_input.dart';

import '../../view_controller/app_top_bar.dart';

class AddReviews extends StatefulWidget {
  const AddReviews({Key? key}) : super(key: key);

  @override
  State<AddReviews> createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  final name = TextEditingController();
  final review = TextEditingController();
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
              AppTopBar(size: size, title: "Add Reviews", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10),
                  child: ListView(
                    children: [
                      AppInput(controller: name, hintText: "Type your name", title: "Name"),
                      SizedBox(height: 30,),
                      Text("Give star",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_rate_sharp, size: 20, color: Colors.amber,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      AppInput(maxLine: 4, controller: review, hintText: "Type here", title: "Write reviews"),

                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: AppButton(width: size.width*.70, height: 55, onClick: (){}, title: "Submit"),
                      )

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
}
