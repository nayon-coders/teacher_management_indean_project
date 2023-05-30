import 'package:flutter/material.dart';
import 'package:teachs/view/home/home.dart';
import 'package:teachs/view/index.dart';

import '../../utility/colors.dart';
import '../../view_controller/app_button.dart';
import '../../view_controller/app_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final email = TextEditingController();
  final pass = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/icons/login-screen.png", height: size.height*.30, width: size.height*.30, fit: BoxFit.contain,)),
              SizedBox(height: size.height*.07,),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome to ",
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600
                        ),
                  ),
                  TextSpan(
                    text: "Caringio",
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w600
                        ),
                  )
                ]
              )),
              SizedBox(height: 7,),
              Text("Please enter your email address and password",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: AppColors.textColor
                ),
              ),
              SizedBox(height: 30,),

              Form(
                child: Column(
                  children: [
                    AppInput(
                        controller: email,
                      title: "Email Address",
                      hintText: "Email address",
                      isValidation: true,
                    ),
                    SizedBox(height: 20,),
                    AppInput(
                      controller: pass,
                      isObscureText: true,
                      title: "Password",
                      hintText: "**********",
                      isValidation: true,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text("Remember me",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Text("Forget password?",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    AppButton(
                      width: size.width*.90,
                      height: 60,
                      title: "Submit",
                      onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Index())),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


