import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';

class DrawerListTiles extends StatelessWidget {

  String title;
  IconData icon;

  DrawerListTiles(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(color: Colors.black,fontSize: 20),),
      leading: Icon(icon,color: Colors.black,size: 22,),
    );
  }
}
