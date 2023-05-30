import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_top_bar.dart';
import 'package:intl/intl.dart';
import '../../../view_controller/app_input.dart';

class PTMAttendance extends StatefulWidget {
  const PTMAttendance({Key? key}) : super(key: key);

  @override
  State<PTMAttendance> createState() => _PTMAttendanceState();
}

class _PTMAttendanceState extends State<PTMAttendance> {

  DateTime selectedDate = DateTime.now();


  final className = TextEditingController();
  final classSection = TextEditingController();
  final date = TextEditingController();
  final subjectName = TextEditingController();

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
              AppTopBar(size: size, title: "PTM Attendance", onTap: ()=>Navigator.pop(context)),
              Expanded(
                child: ListView(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 10),
                      child:  Text("Fill the required field",
                        style: TextStyle(
                          fontSize: 17,
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
                          buildDropDownMenu(
                              title: "Subject Name",
                              stringList: subjectNameList,
                              selectedValue: selectSubject
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
                                      fontSize: 15,
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


                    //search result
                    isSearch? Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 30),
                      child:  Text("Showing results according to your search ",
                        style: TextStyle(
                          fontSize: 17,
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
                            padding: EdgeInsets.only(left: 30, bottom: 15, top: 15, right: 30),
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
                                  ),
                                ),
                                Text("Name",
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                                Text("Status",
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),


                              ],
                            ),
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: Color(0xffF6F2FF),
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: AppColors.white,
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: Color(0xffF6F2FF),
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: AppColors.white,
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: Color(0xffF6F2FF),
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: AppColors.white,
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: Color(0xffF6F2FF),
                          ),

                          buildPtmAttendnaceList(
                            size: size,
                            color: AppColors.white,
                          ),






                          SizedBox(height: 20,),


                        ],
                      ),
                    ) :SizedBox(),


                    SizedBox(height: 30,),

                  ],
                ),
              ),
            ],
          ),

          bottomNavigationBar: Container(
            margin: EdgeInsets.all(20),
            child: AppButton(
                width: size.width,
                height: 60,
                onClick: ()=>showEditPopup(),
                title: "Add new PTM day"
            ),
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
                fontWeight: FontWeight.w500,
                fontSize: 16
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

  //add new dates
  Future<void> showEditPopup() async{
    var size = MediaQuery.of(context).size;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          width: size.width,
          child: AlertDialog(
            titlePadding: const EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
            insetPadding: EdgeInsets.all(20),
            iconPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,

            title:  Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.cancel), color: AppColors.mainColor,)),
            content:  SingleChildScrollView(
              child: Form(
                child: ListBody(
                  children: <Widget>[
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
                      controller: date,
                      hintText: "Select Date",
                      title: "Select Date",
                      isReadOnly: true,
                      suFixIcon: Icons.date_range_outlined,
                      isSuffix: true,
                      onClick: ()=>_selectDate(context),
                    ),
                    SizedBox(height: 30,),
                    AppButton(
                        width: size.width,
                        height: 50,
                        onClick: ()=>Navigator.pop(context),
                        title: "Confirm"),
                  ],
                ),
              ),
            ),

          ),
        );
      },
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


  Container buildPtmAttendnaceList({required Size size, required Color color}) {
    return Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: color
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.width*.15,
                            child: Center(
                              child: Text("45",
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width*.45,
                            child: Center(
                              child: Text("Nayon Talukder",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ),
                      SizedBox
                        (width: size.width*.22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                           // SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  color:  AppColors.red,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text("NO", style: TextStyle(color: AppColors.white),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 7, right: 7, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                  color:  AppColors.green,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text("Yes", style: TextStyle(color: AppColors.white),),
                            ),
                          ],
                        ),
                      )
                        ],
                      ),
                    );
  }
}
