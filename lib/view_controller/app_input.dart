import 'package:flutter/material.dart';
import 'package:teachs/utility/app_const.dart';

import '../utility/colors.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    Key? key,
    required this.controller, required this.hintText, required this.title, this.isValidation = false, this.isObscureText = false,
    this.isSuffix = false,
    this.suFixIcon,
    this.maxLine = 1,
    this.isReadOnly = false,
    this.onClick, this.titleMargin = 10.0,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool isValidation;
  final bool isObscureText;
  final bool isReadOnly;
  final bool isSuffix;
  final IconData? suFixIcon;
  final double titleMargin;
  final dynamic maxLine;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title",
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: titleMargin,),
        TextFormField(
          onTap: onClick,
          readOnly: isReadOnly,
          maxLines: maxLine,
          obscureText: isObscureText!,
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade300)
              ),
              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1, color:Colors.grey.shade300)
              ),

            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(width: 1, color:Colors.grey.shade300)
            ),
              suffixIcon: isSuffix? Icon(suFixIcon):SizedBox(),
              contentPadding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),

              hintText: "$hintText",
            hintStyle: TextStyle(
              fontSize: normalFontSize
            )
          ),
          validator: (v){
            if(isValidation && v!.isEmpty){
              return "$title filled must not be empty.";
            }else{
              return null;
            }
          },
        ),

      ],
    );
  }
}
