import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';
import 'package:easy_localization/easy_localization.dart';

class AlternativeView extends StatelessWidget {
  String image;
  String message;
  bool isAsset;
  bool isCart;


  AlternativeView(this.image, this.message,this.isAsset,this.isCart);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isAsset ? Image.asset(image) :Image.network(image),
          SizedBox(height: 10,),
          Text(message,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          isCart ? NavigationButton('Cart.shoppingButton'.tr().toString(), (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainView()
                )
            );
          },) : Text('')
        ],
      ),
    );
  }
}
