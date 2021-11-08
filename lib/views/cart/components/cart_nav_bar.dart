import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/checkOut/view.dart';
import 'package:easy_localization/easy_localization.dart';

class CartNavBar extends StatefulWidget {

  String subTotal;
  String total;


  CartNavBar({this.subTotal, this.total});

  @override
  _CartNavBarState createState() => _CartNavBarState();
}

class _CartNavBarState extends State<CartNavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey,blurRadius: 0.2)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: 'Cart.subTotal'.tr().toString() + ' : ',
                              style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "${widget.subTotal}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                              )),
                        ]
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan> [
                          TextSpan(
                              text: 'Cart.total'.tr().toString() + ' : ',
                              style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "${widget.total}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                              )),
                        ]
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.40,
            height: 40,
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutView(subTotal: widget.subTotal,total: widget.total,)));
              },
              textColor: Colors.white,
              child: Text('Cart.checkOutButton'.tr().toString()),
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
