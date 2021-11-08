import 'package:flutter/material.dart';

class CommonQuestionsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Common Questions',
      style: TextStyle(color: Colors.purple[300],fontSize: 35,fontFamily:'DancingScript',fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
