import 'package:flutter/material.dart';
import 'package:teachs/utility/colors.dart';
import 'package:teachs/utility/drawer_menu_json.dart';
import 'package:teachs/view_controller/app_button.dart';
class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key, this.scaffoldKey,
  }) : super(key: key);

  final dynamic scaffoldKey;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List activeMenu = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 270,
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill,
                  )
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: (){
                          widget.scaffoldKey.currentState?.closeDrawer();
                          print("this is close drawer");
                        },
                        icon: Icon(Icons.close, color: Colors.white,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color:Colors.white),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/profile.png", height: 55, width: 55, fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Swaza Gupta",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text("St. Mary’s Sr. Sec. School",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white
                    ),
                  )

                ],
              )
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: DrawerMenuJson.drawerMenuList.length,
              itemBuilder: (_, index){
                var data = DrawerMenuJson.drawerMenuList[index];
                return  InkWell(
                  onTap: (){
                    setState(() {
                      activeMenu.clear();
                      activeMenu.add(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: activeMenu.contains(index) ? Color(0xffEEEBFF) : AppColors.white
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
                      horizontalTitleGap: 5,
                      leading: Image.asset(data["icon"], height: 25, width: 25,),
                      title: Text("${data["name"]}",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: activeMenu.contains(index) ? FontWeight.w500 :FontWeight.w400,
                            color: AppColors.black
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            margin: EdgeInsets.all(20),
            child: AppButton(
                width: size.width,
                title: "Log out",
                height: 40,
                onClick: (){

                }
            ),
          )

        ],
      ),
    );
  }
}
