import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_input.dart';
import 'package:teachs/view_controller/app_top_bar.dart';
import 'package:intl/intl.dart';
class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {

  DateTime selectedDate = DateTime.now();


  final className = TextEditingController();
  final classSection = TextEditingController();
  final date = TextEditingController();


  bool isSearch = false;


  final List<String> attendanceItems = [
    'Present',
    'Absent',
    'Partial Present',
  ];
  String? attendanceSelected;

  final List<String> appLavleText = [
    'YES',
    'NO',
  ];
  String? appLavelSelected;


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


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTopBar(size: size, title: "Student Attendance", onTap: ()=>Navigator.pop(context)),

              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 10),
                      child:  Text("Fill the required field",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)
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
                          AppInput(
                            controller: date,
                            hintText: "Select Date",
                            title: "Select Date",
                            isReadOnly: true,
                            suFixIcon: Icons.date_range_outlined,
                            isSuffix: true,
                            onClick: ()=>_selectDate(context),
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  isSearch = true;
                                });
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(child: Text("Done",
                                  style: TextStyle(
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white
                                  ),
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ) ,


                    SizedBox(height: 30,),



                    //search result
                    isSearch? Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 10),
                      child:  Text("Showing results according to your search ",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ):SizedBox(),

                    isSearch ? Container(
                      //padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            // height: 50,
                            padding: EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Roll No.",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: normalFontSize
                                  ),
                                ),
                                Text("Name",
                                  style: TextStyle(
                                    color: AppColors.white,
                                      fontSize: normalFontSize
                                  ),
                                ),
                                Text("Status",
                                  style: TextStyle(
                                    color: AppColors.white,
                                      fontSize: normalFontSize
                                  ),
                                ),
                                Text("App lavel",
                                  style: TextStyle(
                                    color: AppColors.white,
                                      fontSize: normalFontSize
                                  ),
                                )
                              ],
                            ),
                          ),

                          buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ),
                          buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ),
                          buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ),
                          buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ), buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ),
                          buildStudentList(
                            size:size,
                            color: AppColors.white,
                          ),
                          buildStudentList(
                            size:size,
                            color: Color(0xffF6F2FF),
                          ),





                          SizedBox(height: 20,),


                        ],
                      ),
                    ) :SizedBox(),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


  //select date
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

  Container buildStudentList({required Size size, required Color color,}) {
    return Container(
                      padding: EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
                      decoration: BoxDecoration(
                        color: color
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.width*.10,
                            child: Center(
                              child: Text("45",
                                style: TextStyle(
                                  color: AppColors.black,
                                    fontSize: normalFontSize
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width*.35,
                            child: Center(
                              child: Text("Nayon Talukder",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: AppColors.black,
                                    fontSize: normalFontSize
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width*.20,
                            // child:  InkWell(
                            //   onTap: (){},
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("Present",
                            //         overflow: TextOverflow.clip,
                            //         style: TextStyle(
                            //           color: AppColors.black,
                            //         ),
                            //       ),
                            //       SizedBox(width: 0,),
                            //       Icon(Icons.arrow_right_outlined, color: Colors.grey,)
                            //     ],
                            //   ),
                            // ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Text(
                                  '${attendanceItems[0]}',
                                  style: TextStyle(
                                      fontSize: normalFontSize,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: attendanceItems
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style:  TextStyle(
                                        fontSize: normalFontSize
                                    ),
                                  ),
                                ))
                                    .toList(),
                                value: attendanceSelected,
                                onChanged: (value) {
                                  setState(() {
                                    attendanceSelected = value as String;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 20,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width*.20,
                            // child:  InkWell(
                            //   onTap: (){},
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         padding: EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                            //         decoration: BoxDecoration(
                            //           color: AppColors.mainColor,
                            //           borderRadius: BorderRadius.circular(5)
                            //         ),
                            //         child: Text("YES", style: TextStyle(color: AppColors.white),),
                            //       ),
                            //       SizedBox(width: 0,),
                            //       Icon(Icons.arrow_right_outlined, color: Colors.grey,)
                            //     ],
                            //   ),
                            // ),
                            child:  DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint:  Container(
                                  padding: EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Text("${appLavleText[0]}", style: TextStyle(color: AppColors.white,  fontSize: normalFontSize),),
                                ),
                                items: appLavleText
                                    .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child:  Container(
                                    padding: EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                                    decoration: BoxDecoration(
                                        color: item== "YES" ? AppColors.mainColor : AppColors.red,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text("$item", style: TextStyle(color: AppColors.white,  fontSize: normalFontSize),),
                                  ),
                                ))
                                    .toList(),
                                value: appLavelSelected,
                                onChanged: (value) {
                                  setState(() {
                                    appLavelSelected = value as String;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  height: 40,
                                  width: 20,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
  }
}
