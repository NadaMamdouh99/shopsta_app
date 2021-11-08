import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';


class NotificationContent extends StatelessWidget {

  int id;
  String title;
  String message;


  NotificationContent(this.id,this.title, this.message);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation( 1,
       Container(
        margin: EdgeInsets.only(top: 15,left: 10,right: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
              padding: EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5.5,
              decoration: BoxDecoration(
                color: id.isEven ? kPrimaryColor: Colors.purple[100] ,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(title, style: TextStyle(color: Colors.white, fontSize: 30),textAlign: TextAlign.center,),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 25,right: 25,bottom: 5),
                  child: Text(message,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
