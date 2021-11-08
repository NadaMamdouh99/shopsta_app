import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class ProfileTextFields extends StatelessWidget {
  IconData icon;
  String hintText;
  bool isEnabled;


  ProfileTextFields(this.icon,this.hintText, this.isEnabled);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      height: MediaQuery.of(context).size.height/8,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        readOnly: isEnabled,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: isEnabled ? 13:18,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
