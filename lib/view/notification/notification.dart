import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/view/index.dart';
import 'package:teachs/view_controller/app_top_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          AppTopBar(
              size: size,
              title: "Notification",
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Index()))
          ),

         SizedBox(
           height: size.height*.80,
           child: ListView(
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20.0, right: 15),
                 child: Text("Today",
                   style: TextStyle(
                     fontSize: 17,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.all(20),
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(5),
                 ),
                 child: Column(
                   children: [
                     buildNotification(),
                     buildNotification(),
                     buildNotification(),
                     buildNotification(),
                     buildNotification(border: false)
                   ],
                 ),
               ),

               SizedBox(height: 30,),
               Padding(
                 padding: const EdgeInsets.only(left: 20.0, right: 15),
                 child: Text("5 May",
                   style: TextStyle(
                     fontSize: 17,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
               Container(
                 margin: EdgeInsets.all(20),
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(5),
                 ),
                 child: Column(
                   children: [
                     buildNotification(),
                     buildNotification(),
                     buildNotification(),
                     buildNotification(),
                     buildNotification(border: false)
                   ],
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }

  Container buildNotification({bool border = true}) {
    return Container(
                     //padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                         border: border ? Border(
                             bottom: BorderSide(width: 1, color: Colors.grey.shade300)
                         ): Border.fromBorderSide(BorderSide.none)
                     ),
                     child: ListTile(
                       minVerticalPadding: 15,
                       horizontalTitleGap: 15,
                       contentPadding: EdgeInsets.zero,
                       leading: Image.asset("assets/images/p-1.png"),
                       title: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: [
                               Text("Nayon Talukder",
                                 style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     color: Color(0xff4E35D4),
                                     fontSize: 13
                                 ),
                               ),
                               SizedBox(width: 10,),
                               Text("Time: ",
                                 style: TextStyle(
                                     fontWeight: FontWeight.w300,
                                     color: Colors.grey.shade600,
                                     fontSize: 12
                                 ),
                               ),
                               Text("1 hours ago",
                                 style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     color: Colors.black,
                                     fontSize: 13
                                 ),
                               ),
                             ],
                           ),
                           Icon(Icons.more_horiz, color: Colors.grey,)
                         ],
                       ),
                       subtitle: Padding(
                         padding: const EdgeInsets.only(top: 0.0),
                         child: Text(
                           "Et nec tantas accusamus salutatus, sit commodo veritus te, erat  fabulas has ut. erat",

                           style: TextStyle(
                             fontWeight: FontWeight.w300,
                             fontSize: 13
                           ),
                         ),
                       ),
                     ),

                   );
  }
}
