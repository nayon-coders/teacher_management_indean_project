import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_top_bar.dart';
import 'package:intl/intl.dart';
import '../../utility/app_const.dart';
import '../../view_controller/app_input.dart';

class CreateTest extends StatefulWidget {
  const CreateTest({Key? key}) : super(key: key);

  @override
  State<CreateTest> createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {

  DateTime selectedDate = DateTime.now();

  TimeOfDay? selectedTime;

  final className = TextEditingController();
  final classSection = TextEditingController();
  final date = TextEditingController();
  final subjectName = TextEditingController();
  final testName = TextEditingController();
  final testMaxMark = TextEditingController();
  final testSyllabus = TextEditingController();
  final testDate = TextEditingController();
  final testTime = TextEditingController();

  bool isSearch = false;



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

  final List<String> subjectNameList = [
    'English',
    'Math',
    'Hindi',
  ];
  final List<String> testStarList = [
    'Test star 1',
    'Test star 2',
    'Test star 3',
    'Test star 4',

  ];
  String? selectClass;
  String? selectClassSection;
  String? selectSubject;
  String? selectTestStar;




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              AppTopBar(size: size, title: "Create Test", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    children: [
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
                      AppInput(
                        controller: testName,
                        hintText: "Tes Name",
                        title: "Test Name",
                      ),
                      SizedBox(height: 20,),
                      buildDropDownMenu(
                          title: "Test star",
                          stringList: testStarList,
                          selectedValue: selectTestStar
                      ),
                      SizedBox(height: 20,),
                      AppInput(
                        controller: testMaxMark,
                        hintText: "Test Mark",
                        title: "Test maximum mark",
                      ),
                      SizedBox(height: 20,),
                      Text("Test schedule",
                        style: TextStyle(
                          fontSize: normalFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width*.43,
                            child: AppInput(
                              controller: date,
                              hintText: "Select Date",
                              title: "",
                              isReadOnly: true,
                              suFixIcon: Icons.date_range_outlined,
                              isSuffix: true,
                              onClick: ()=>_selectDate(context),
                            ),
                          ),
                          SizedBox(
                            width: size.width*.43,
                            child: AppInput(
                              controller: testTime,
                              hintText: "Select Time",
                              title: "",
                              isReadOnly: true,
                              suFixIcon: Icons.watch_later_outlined,
                              isSuffix: true,
                              onClick: ()=>_selectTime(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      AppInput(
                        controller: testMaxMark,
                        hintText: "Type syllabus details",
                        maxLine: 4,
                        title: "Test syllabus ",
                      ),
                      SizedBox(height: 30,),

                      AppButton(width: size.width, height: 60, onClick: (){}, title: "Create test"),

                      SizedBox(height: 40,),
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

  //select dates
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
  }

  //select dates
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay?  picked = (await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
       ));
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        testTime.text = "${selectedTime?.hour}:${selectedTime?.minute}";
      });
  }

}
