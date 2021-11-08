import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/cart/view.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/views/profileInfo/view.dart';
import 'package:shopsta_app/widgets/drawer.dart';
import 'package:shopsta_app/widgets/logo.dart';

homeAppBar(elevation,context,isInProfileInfo,isInCart) => AppBar(
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.black),
  centerTitle: true,
  title: Logo(32,32,400,20),
  elevation: elevation,
  //leading: isInProfileInfo ? ShopstaDrawer() : null,
  actions: [
    CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            icon: isInCart ? Icon(Icons.home,size: 25,color: kPrimaryColor,):Icon(Icons.shopping_cart_rounded,size: 25,color: kPrimaryColor,),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => isInCart ? MainView() : CartView())
              );
            },
          ),
          isInCart ? Text('') : CircleAvatar(
            child: Text('${SharedHelper.getCartCount}',style: TextStyle(color: Colors.white,fontSize: 13),),
            backgroundColor: Colors.red,
            radius: 9,
          ),
        ],
      ),
      radius: 20,
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        child: IconButton(
          icon: isInProfileInfo ? Icon(Icons.home,size: 25,color: kPrimaryColor,):Icon(Icons.person,size: 25,color: kPrimaryColor,),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileInfoView())
            );
          },
        ),
        radius: 20,
      ),
    ),
  ],
);