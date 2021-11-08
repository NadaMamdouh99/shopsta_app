import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextInputType keyBoardType;
  TextEditingController textFieldController;


  CustomTextField(this.hintText, this.icon,this.keyBoardType,{this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
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
          fillColor: kPrimaryLightColor,
        ),
        controller: textFieldController,
        validator: (value) {
          if(hintText=='Email'){
            if(value.isEmpty) return 'Email can\'t be empty';
            else if (!value.contains('@')) return 'Mising @';
            else return null;
          }
          else if(hintText=='Name'){
            if(value.isEmpty) return 'Name can\'t be empty';
            else return null;
          }
          if(value.isEmpty) return '$hintText can\'t be empty';
          //else if (value.length < 11) return 'Phone can\'t be less than 11 number ';
          else return null;
        },
      ),
    );
  }
}
