import 'dart:async';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/mainView/view.dart';

class SliverBar extends StatelessWidget {

  List images;
  String productName;

  SliverBar(this.images, this.productName,);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      //stretchTriggerOffset: 150,
      expandedHeight: 250.0,
      pinned: true,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left:10,top:0,right: 5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          //radius: 65,
          child: IconButton(
              icon:Icon(Icons.arrow_back,color: kPrimaryColor,),
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left:0.0,top: 0,right: 5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            //radius: 20,
            child: IconButton(
                icon:Icon(Icons.home_outlined,color: kPrimaryColor,),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainView()
                      )
                  );
                }
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          padding: EdgeInsets.only(top: 20,left:5,right: 5),
          child: Text(productName,style: TextStyle(color: kPrimaryColor,fontFamily: 'DancingScript',fontWeight: FontWeight.w600,fontSize: 15),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width/1.5,
          height: 40,
        ),
        centerTitle: true,
        background: Column(
          children: [
            Expanded(
              child: Carousel(
                images: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 30),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    itemCount:images.length,
                    itemBuilder: (BuildContext context,int index){
                      return Image.network('${images[index]}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ],
                autoplay: true,
                autoplayDuration: Duration(seconds: 2),
                animationDuration: Duration(seconds: 2),
                overlayShadow: false,
                showIndicator: false,
              ),
            ),
            SizedBox(height: 80,)
            // Image.network(
            //   image,
            //   width: MediaQuery.of(context).size.width,
            //   height: 210,
            //   fit: BoxFit.cover,
            // ),
          ],
        ),
      ),
    );
  }
}
