import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/complaints/controllers/controller.dart';

class ComplaintTextField extends StatelessWidget {

  String hintText;
  IconData icon;
  TextInputType keyBoardType;
  dynamic controller;

  ComplaintTextField(this.hintText, this.icon, this.keyBoardType,this.controller);

  @override
  Widget build(BuildContext context) {
    //final complaintController = ComplaintController.of(context);
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
        maxLines: 10,
        maxLength: 10,
        controller: controller,
        decoration: InputDecoration(
         icon:Padding(
           padding: const EdgeInsets.only(bottom:170),
           child: Icon(
              icon,
              color: kPrimaryColor,
            ),
         ),
          hintText: hintText,
          border: InputBorder.none,
          fillColor: kPrimaryLightColor,
        ),
      ),
    );
  }
}
