import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:intl/intl.dart';
import 'package:teachs/view_controller/app_button.dart';
import '../../utility/app_const.dart';
import '../../view_controller/app_input.dart';
import '../../view_controller/app_top_bar.dart';

class CreateAssignment extends StatefulWidget {
  const CreateAssignment({Key? key}) : super(key: key);

  @override
  State<CreateAssignment> createState() => _CreateAssignmentState();
}

class _CreateAssignmentState extends State<CreateAssignment> {


  DateTime selectedDate = DateTime.now();


  final className = TextEditingController();
  final classSection = TextEditingController();
  final date = TextEditingController();
  final subjectName = TextEditingController();
  final assignmentDetails = TextEditingController();

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
  String? selectClass;
  String? selectClassSection;
  String? selectSubject;




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
              AppTopBar(size: size, title: "Create Assignment", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width*.43,
                            child: AppInput(
                              controller: date,
                              hintText: "Assigned date",
                              title: "Assignment Date",
                              isReadOnly: true,
                              suFixIcon: Icons.date_range_outlined,
                              isSuffix: true,
                              onClick: ()=>_selectDate(context),
                            ),
                          ),
                          SizedBox(
                            width: size.width*.43,
                            child: AppInput(
                              controller: date,
                              hintText: "Submission date",
                              title: "",
                              isReadOnly: true,
                              suFixIcon: Icons.date_range_outlined,
                              isSuffix: true,
                              onClick: ()=>_selectDate(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      AppInput(
                        controller: assignmentDetails,
                        hintText: "Type assignment here",
                        title: "Assignment Details",
                        isReadOnly: true,
                        isSuffix: true,
                        maxLine: 5,
                        onClick: ()=>_selectDate(context),
                      ),
                      SizedBox(height: 15,),
                      Text("Upload photo",
                        style: TextStyle(
                        fontSize: normalFontSize,
                        fontWeight: FontWeight.w600,
                       ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: AppColors.borderColor)
                        ),
                        child: DottedBorder(
                          color: AppColors.mainColor,
                          strokeWidth: 1,
                          dashPattern:[1-3],
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.1)
                            ),
                            child: Center(
                              child: Image.asset("assets/images/upload.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      AppButton(width: size.width, height: 55, onClick: (){}, title: "Create assignment"),
                      SizedBox(height: 30,),

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
              color: AppColors.white,
              border: Border.all(width: 1, color: Colors.grey.shade300)
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
