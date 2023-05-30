import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_button.dart';
import 'package:teachs/view_controller/app_top_bar.dart';
import 'package:intl/intl.dart';

import '../../../view_controller/app_input.dart';
class TeacherAttendance extends StatefulWidget {
  const TeacherAttendance({Key? key}) : super(key: key);

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final dateFormate = DateFormat.yMMMMd('en_US');
  late final monthOfTheYear = DateFormat.yMMM().format(DateTime.now());
  late dynamic toMonth;
  var monthFormat = DateFormat("yyyy-MM");
  dynamic toDay;
  dynamic month = DateFormat("yyyy-MM").format(DateTime.now());
  dynamic SearchDay;
  bool selectDate = false;
  bool selectMonth = false;
  var currentMonthYear = DateTime.now().month;
  double calenderheight = 180.00;

  final startDate = TextEditingController();
  final endDate = TextEditingController();
  final cause = TextEditingController();

  var currentDates = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.bg,
            body: Column(
              children: [
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(bottom: 0),
                  height: 180,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed:()=>Navigator.pop(context),
                              icon: Icon(Icons.arrow_back, color: AppColors.white,)
                          ),
                          SizedBox(width: size.width*.23,),
                          Text("My Attendnace",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      TabBar(
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Text("Calender",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Tab(
                              child: Text("Holidays",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),

                         ]
                      )
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    //height: size.height,
                    transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                    child: TabBarView(
                        children: [
                          buildCalendar(),
                         buildHoliday(),
                        ]
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  buildCalendar() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2022),
              lastDay: DateTime.utc(2500),
              focusedDay: _focusedDay,
              rowHeight: 55,
              calendarFormat: _calendarFormat,
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.only(top: 15),
                cellPadding: EdgeInsets.all(5),
                outsideDaysVisible: true,
                defaultDecoration: BoxDecoration(
                  //color: Colors.black.withOpacity(0.2),
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(100),
                ),
                rangeHighlightScale: 30.0,
                weekNumberTextStyle: TextStyle(
                    fontSize: 20
                ),
                markerSize: 100.0,
                todayTextStyle: TextStyle(
                  fontSize: 16, color: AppColors.red,
                  fontWeight: FontWeight.w600
                ),
                todayDecoration: BoxDecoration(
                    //color: AppColors.red,
                    shape: BoxShape.circle
                ),
                weekendTextStyle: TextStyle(color: AppColors.white,),
                defaultTextStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
                selectedTextStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w600
                ),
                selectedDecoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColors.black,
                ),
                weekendStyle: TextStyle(
                  color: AppColors.white,
                ),
              ),
              weekendDays: [DateTime.friday],
              headerStyle: HeaderStyle(
                  titleCentered: true,
                  headerMargin: const EdgeInsets.only(top: 10, bottom: 40, left: 50, right: 50),
                  headerPadding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  titleTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.black,
                  ),
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15,
                  )),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {

                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  selectDate = true;
                });
                SearchDay =
                (DateFormat("yyyy-MM-dd").format(_selectedDay!));
                currentDates = DateFormat.yMMMd().format(_selectedDay!);
                toDay = (dateFormate.format(_selectedDay!));
                print(SearchDay);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                setState(() {
                  selectMonth = true;
                });
                _focusedDay = focusedDay;
                month = monthFormat.format(_focusedDay);
                toMonth = (dateFormate.format(_focusedDay));
              },
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildStatus(
                color: Color(0xff00A62E),
                title: "Present"
              ),
              buildStatus(
                  color: Color(0xffFF0000),
                  title: "Absent"
              ),
              buildStatus(
                  color: Color(0xff009EFF),
                  title: "Partially present "
              ),
              buildStatus(
                  color: Color(0xffFF5916),
                  title: "Holiday"
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            width: size.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.borderColor.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0,1)
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total working days",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),

                Text("26 Days",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.mainColor
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width*.45,
                height: 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.borderColor.withOpacity(0.5),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0,1)
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Absent",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    //SizedBox(height: 20,),
                    Text("23",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        color: AppColors.mainColor
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width*.45,
                height: 150,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.borderColor.withOpacity(0.5),
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0,1)
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total Absent",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    //SizedBox(height: 20,),
                    Text("23",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        color: AppColors.mainColor
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),


          SizedBox(height: 30,),
          AppButton(
              width: size.width,
              height: 50,
              onClick: ()=>applyForLeave(),
              title: "Apply for leave"
          ),
          //SizedBox(height: 30,),
        ],
      ),
    );
  }

  buildHoliday() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),

            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2022),
              lastDay: DateTime.utc(2500),
              focusedDay: _focusedDay,
              rowHeight: 55,
              calendarFormat: _calendarFormat,
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.only(top: 15),
                cellPadding: EdgeInsets.all(5),
                outsideDaysVisible: true,
                defaultDecoration: BoxDecoration(
                  //color: Colors.black.withOpacity(0.2),
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(100),
                ),
                rangeHighlightScale: 30.0,
                weekNumberTextStyle: TextStyle(
                    fontSize: 20
                ),
                markerSize: 100.0,
                todayTextStyle: TextStyle(
                    fontSize: 16, color: AppColors.red,
                    fontWeight: FontWeight.w600
                ),
                todayDecoration: BoxDecoration(
                  //color: AppColors.red,
                    shape: BoxShape.circle
                ),
                weekendTextStyle: TextStyle(color: AppColors.white,),
                defaultTextStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
                selectedTextStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.w600
                ),
                selectedDecoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColors.black,
                ),
                weekendStyle: TextStyle(
                  color: AppColors.red,
                ),

              ),
              weekendDays: [DateTime.friday],
              headerStyle: HeaderStyle(
                  titleCentered: true,
                  headerMargin: const EdgeInsets.only(top: 10, bottom: 40, left: 50, right: 50),
                  headerPadding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  titleTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.black,
                  ),
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 15,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 15,
                  )),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {

                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  selectDate = true;
                });
                SearchDay =
                (DateFormat("yyyy-MM-dd").format(_selectedDay!));
                currentDates = DateFormat.yMMMd().format(_selectedDay!);
                toDay = (dateFormate.format(_selectedDay!));
                print(SearchDay);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                setState(() {
                  selectMonth = true;
                });
                _focusedDay = focusedDay;
                month = monthFormat.format(_focusedDay);
                toMonth = (dateFormate.format(_focusedDay));
              },
            ),
          ),
          SizedBox(height: 30,),
          Text("Holidays for  May, 23",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: size.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.borderColor.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0,1)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("International Labour Day",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),

                Text("01, May",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.red
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: size.width,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.borderColor.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0,1)
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bodho purnima",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),

                Text("23, May",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.red
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 30,),
        ],
      ),
    );
  }

  Row buildStatus({required Color color, required String title}) {
    return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: color)
                  ),
                  child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                         color: color,
                         borderRadius: BorderRadius.circular(100),
                      //   border: Border.all(width: 1, color: AppColors.red)
                      ),
                  )
                ),
                SizedBox(width: 5,),
                Text(title)
              ],
            );
  }



  Future<void> applyForLeave() async{
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
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                         width: size.width*.38,
                         child: AppInput(
                             controller: startDate,
                             hintText: "Pick a date",
                             title: "Start Date",
                           suFixIcon: Icons.date_range,
                           isSuffix: true,
                         ),
                       ),
                       //SizedBox(width: 20,),
                       SizedBox(
                         width: size.width*.38,
                         child: AppInput(
                             controller: endDate,
                             hintText: "Pick a date",
                             title: "End date",
                           suFixIcon: Icons.date_range,
                           isSuffix: true,
                         ),
                       ),
                     ],
                   ),
                    SizedBox(height: 20,),
                    AppInput(
                        controller: cause,
                        hintText: "Type here...",
                        title: "Cause for leave",
                      maxLine: 5,
                    ),
                    SizedBox(height: 30,),
                    AppButton(
                        width: size.width,
                        height: 50,
                        onClick: (){},
                        title: "Confirm"),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),

          ),
        );
      },
    );

  }



}
