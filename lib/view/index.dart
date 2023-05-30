import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:teachs/view/class_scehdule/class_schedule_list.dart';
import 'package:teachs/view/home/home.dart';
import 'package:teachs/view/notification/notification.dart';

import '../utility/colors.dart';


class Index extends StatefulWidget {
  final int currentPage;
  const Index({Key? key,  this.currentPage = 0}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {



  List pages = [
    Home(),
    ClassScheduleList(),
    Notifications(),
    Notifications(),
  ];

  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: SafeArea(
        child: Scaffold(
          body: pages[currentPage],
          bottomNavigationBar: CircleBottomNavigationBar(
            iconYAxisSpace: -0.2,
            itemTextOff: 1,
            initialSelection: currentPage,
            circleColor: AppColors.mainColor,
            activeIconColor: Colors.white,
            inactiveIconColor: Colors.grey,
            tabs: [

              TabData(
                icon: Icons.home_filled,
                iconSize: 25,// Optional
                title: 'Home',// Optional
                fontSize: 12,// Optional
              ),
              TabData(
                icon: Icons.alarm,
                iconSize: 25,// Optional
                title: 'Class Time',// Optional
                fontSize: 12,// Optional
              ),
              TabData(
                icon: Icons.help,
                iconSize: 25,// Optional
                title: 'Query',// Optional
                fontSize: 12,// Optional
              ),
              TabData(
                icon: Icons.notifications,
                iconSize: 25,// Optional
                title: 'Notification',// Optional
                fontSize: 12,// Optional
              ),
            ],
            onTabChangedListener: (index) => setState(() => currentPage = index),
          ),
        ),
      ),
    );
  }
}
