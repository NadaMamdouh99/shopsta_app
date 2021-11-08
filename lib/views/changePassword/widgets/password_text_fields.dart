import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class PasswordTextFields extends StatelessWidget {

  String hintText;
  TextEditingController textFieldController;
  



  PasswordTextFields(this.hintText, {this.textFieldController});

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
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        validator: (value) {

          if(value.isEmpty) return 'password can\'t be empty';
          else if (value.length < 4) return 'The password must be more than 4 char';
          else return null;
        },
        controller: textFieldController,
      ),
    );
  }
}
