import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';

import '../../view_controller/app_input.dart';
import '../../view_controller/app_top_bar.dart';

class TestUploadAnswer extends StatefulWidget {
  const TestUploadAnswer({Key? key}) : super(key: key);

  @override
  State<TestUploadAnswer> createState() => _TestUploadAnswerState();
}

class _TestUploadAnswerState extends State<TestUploadAnswer> {


  final List<String> classNameList = [
    "Select One",
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
  ];

  final List<String> classSectionList = [
    "Select One",
    'Class Section 1',
    'Class Section 2',
    'Class Section 3',
    'Class Section 4',
    'Class Section 5',
  ];

  final List<String> examinationTimeList = [
    "Select One",
    '10:00 AM',
    '12:00 AM',
    '2:00 AM',
    '4:00 AM',
  ];

  String? selectClass;
  String? selectClassSection;
  String? selectExaminationTime;

  final examRef = TextEditingController();

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
              AppTopBar(size: size, title: "Upload answer sheets", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    children: [
                      Text("Fill the required field",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.shade300,
                          //     spreadRadius: 1,
                          //     blurRadius: 1,
                          //     offset: Offset(0,1)
                          //   )
                          // ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            buildDropDownMenu(
                                title: "Class Name",
                                stringList: classNameList,
                                selectedValue: selectClass
                            ),
                            SizedBox(height: 20,),
                            buildDropDownMenu(
                                title: "Class Section",
                                stringList: classSectionList,
                                selectedValue: selectClassSection
                            ),
                            SizedBox(height: 20,),
                            buildDropDownMenu(
                                title: "Examination name",
                                stringList: examinationTimeList,
                                selectedValue: selectExaminationTime
                            ),

                            SizedBox(height: 20,),
                            AppInput(
                              controller: examRef,
                              hintText: "Write here",
                              title: "Examination references",
                              maxLine: 4,
                            ),
                            SizedBox(height: 20,),
                            Text("Upload files",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: normalFontSize
                              ),
                            ),
                            SizedBox(height: 10,),
                            DottedBorder(
                              color: Color(0xff826BFC).withOpacity(0.2),
                              strokeWidth: 2,
                              radius: Radius.circular(10),
                              dashPattern:[5,2],
                              borderType: BorderType.RRect,
                              child: Container(
                                width: size.width,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xff826BFC).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: AppColors.mainColor, size: 20,),
                                    SizedBox(width: 5,),
                                    Text("Add File",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.mainColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      AppButton(width: size.width, height: 55, onClick: (){}, title: "Done"),

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
  //dropdown
  Column buildDropDownMenu({
    required String title,
    required String? selectedValue,
    required List stringList
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: normalFontSize
          ),
        ),
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.grey.shade400)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                '${stringList[0]}',
                style: TextStyle(
                    fontSize: normalFontSize,
                    color: AppColors.black
                ),
              ),
              items: stringList
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:  TextStyle(
                    fontSize: normalFontSize,
                  ),
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
                print("this is value === ${selectedValue}");
              },

            ),
          ),
        ),
      ],
    );
  }
}
