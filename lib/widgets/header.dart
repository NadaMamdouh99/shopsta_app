import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String title;
  double size;

  Header(this.title, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: TextStyle(color: Colors.purple[300],fontSize: size,fontFamily:'DancingScript',fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
