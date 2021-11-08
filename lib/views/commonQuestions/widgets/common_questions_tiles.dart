import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class CommonQuestionsTiles extends StatelessWidget {
  String question;
  String body;
  IconData icon;


  CommonQuestionsTiles(this.question, this.body,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: ExpansionTile(
        backgroundColor: kPrimaryLightColor,
        maintainState: false,
        childrenPadding: EdgeInsets.symmetric(vertical: 10),
        title: Text(question,style: TextStyle(color: Colors.black),),
        leading: Icon(icon,color: kPrimaryColor,),
        children: [
          Text(body,style: TextStyle(color: Colors.black54),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
