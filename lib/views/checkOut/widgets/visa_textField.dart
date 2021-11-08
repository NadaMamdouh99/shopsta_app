import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';


class VisaTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextInputType keyBoardType;
  double width;
  Function validation;
  TextEditingController textFieldController;


  VisaTextField({this.hintText, this.icon, this.keyBoardType, this.width,this.validation,this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          //fillColor: kPrimaryLightColor,
        ),
        controller: textFieldController,
        validator: validation
      ),
    );
  }
}
