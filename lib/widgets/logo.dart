import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Logo extends StatelessWidget {
  double width;
  double height;
  double Conheight;
  double titleSize;

  Logo(this.width, this.height,this.Conheight,this.titleSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: Conheight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/shopping.png',width: width,height: height,),
          Text('Shopsta',style: TextStyle(color: Colors.purple[300],fontSize: titleSize,fontFamily:'DancingScript',fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
