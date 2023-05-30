import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_input.dart';
import 'package:teachs/view_controller/app_top_bar.dart';

class NotifyParents extends StatefulWidget {
  const NotifyParents({Key? key}) : super(key: key);

  @override
  State<NotifyParents> createState() => _NotifyParentsState();
}

class _NotifyParentsState extends State<NotifyParents> {

  final testName = TextEditingController();
  final syllabusDetails = TextEditingController();
  final messages = TextEditingController();



  final List<String> classNameList = [
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
    'Class Section 1',
    'Class Section 2',
    'Class Section 3',
    'Class Section 4',
    'Class Section 5',
  ];

  String? selectClass;
  String? selectClassSection;
  String? selectSubject;
  final List<String> subjectNameList = [
    'English',
    'Math',
    'Hindi',
  ];



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              AppTopBar(size: size, title: "Notify Parents", onTap: ()=>Navigator.pop(context)),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                  child: ListView(
                    children: [
                      AppInput(controller: testName, hintText: "Type test name", title: "Test Name"),
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
                          title: "Subject Name",
                          stringList: subjectNameList,
                          selectedValue: selectSubject
                      ),
                      SizedBox(height: 20,),
                      AppInput(controller: testName, hintText: "Type syllabus details", title: "Syllabus Details", maxLine: 4,),
                      SizedBox(height: 20,),
                      AppInput(controller: testName, hintText: "Type your messages", title: "Your Messages", maxLine: 4,),
                      SizedBox(height: 30,),
                      AppButton(width: size.width, height: 60, onClick: (){}, title: "Send")

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
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: AppColors.borderColor)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(
                '${stringList[0]}',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black
                ),
              ),
              items: stringList
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
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
