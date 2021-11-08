import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class NavigationButton extends StatelessWidget {
  String title;
  Widget page;
  Function function;

  NavigationButton(this.title,this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 5,bottom: 10,left: 28,right: 28),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: kPrimaryColor,
          onPressed: function,
          child: Text(
            title,
            style: TextStyle(color: kPrimaryLightColor),
          ),
        ),
      ),
    );
  }
}

// (){
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => page)
// );
// },