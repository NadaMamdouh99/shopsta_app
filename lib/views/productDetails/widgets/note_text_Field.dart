import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class NoteTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextInputType keyBoardType;


  NoteTextField(this.hintText, this.icon,this.keyBoardType);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.95,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
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
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
