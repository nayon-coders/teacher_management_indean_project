import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view_controller/app_input.dart';

import '../../utility/app_const.dart';
import '../../view_controller/app_top_bar.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {


  bool isSearch = false;


  final refLink = TextEditingController();
  final attachMent = TextEditingController();

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
              AppTopBar(size: size, title: "Syllabus", onTap: ()=>Navigator.pop(context)),
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

                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(15),
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
                                        fontSize: titleFontSize,
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


                      SizedBox(height: 20,),

                    isSearch ?  Column(
                        children: [
                          buildSyllabusTopic(size),
                          buildSyllabusTopic(size),
                          buildSyllabusTopic(size),
                          buildSyllabusTopic(size),
                          buildSyllabusTopic(size),
                        ],
                      ):SizedBox()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSyllabusTopic(Size size) {
    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chapter 1",
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 7,),
                        Container(
                          width: size.width,
                          height: 50,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: AppColors.mainColor.withOpacity(0.7)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*.25,
                                child: Center(
                                  child: Text("Topic",
                                    style: TextStyle(
                                      fontSize: normalFontSize,
                                      color: AppColors.white
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width*.45,
                                child: Center(
                                  child: Text("Syllabus",
                                    style: TextStyle(
                                        fontSize: normalFontSize,
                                        color: AppColors.white
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width*.15,
                                child: Center(
                                  child: Text("Progress",
                                    style: TextStyle(
                                        fontSize: normalFontSize,
                                        color: AppColors.white
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width*.25,
                                  child: Text("Classification of present tense & use.",
                                    style: TextStyle(
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*.45,
                                  child: Text("Lorem ipsum is placehold text commonly used in bfdd the graphic commonly .",
                                    style: TextStyle(
                                        fontSize: normalFontSize,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*.15,
                                  child:SimpleCircularProgressBar(
                                    size: 50,
                                    valueNotifier: ValueNotifier(90.0),
                                    progressStrokeWidth: 2,
                                    backStrokeWidth: 2,
                                    mergeMode: true,
                                    animationDuration: 3,
                                    onGetText: (value) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: TextStyle(

                                        ),
                                      );
                                    },
                                    progressColors: const [AppColors.mainColor, AppColors.mainColor],
                                    backColor: Colors.black.withOpacity(0.4),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Color(0xffF6F2FF),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width*.25,
                                  child: Text("Classification of present tense & use.",
                                    style: TextStyle(
                                        fontSize: normalFontSize,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*.45,
                                  child: Text("Lorem ipsum is placehold text commonly used in bfdd the graphic commonly .",
                                    style: TextStyle(
                                        fontSize: normalFontSize,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width*.15,
                                  child:SimpleCircularProgressBar(
                                    size: 50,
                                    valueNotifier: ValueNotifier(90.0),
                                    progressStrokeWidth: 2,
                                    backStrokeWidth: 2,
                                    mergeMode: true,
                                    animationDuration: 3,
                                    onGetText: (value) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: TextStyle(

                                        ),
                                      );
                                    },
                                    progressColors: const [AppColors.mainColor, AppColors.mainColor],
                                    backColor: Colors.black.withOpacity(0.4),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        AppInput(controller: refLink, hintText: "inputText", title: "Reference links"),
                        AppInput(
                          controller: attachMent,
                          hintText: "View attached file",
                          title: "",
                          titleMargin: 0,
                          isReadOnly: true,
                          isSuffix: true,
                          suFixIcon:  Icons.file_copy_outlined,
                        ),
                        SizedBox(height: 30,),
                      ],
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
}
