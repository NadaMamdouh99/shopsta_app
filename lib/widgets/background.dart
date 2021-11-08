import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  Widget child;
  String image1;
  String image2;


  Background(this.child,this.image1,this.image2);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              image1,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              image2,
              width:MediaQuery.of(context).size.width * 0.25,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
