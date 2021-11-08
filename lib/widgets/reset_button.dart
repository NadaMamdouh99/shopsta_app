import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class ResetButton extends StatelessWidget {
  String title;
  Function function;

  ResetButton(this.title,this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.only(top: 5,bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          color: kPrimaryColor,
          onPressed:function,
          child: Text(
            title,
            style: TextStyle(color: kPrimaryLightColor),
          ),
        ),
      ),
    );
  }
}