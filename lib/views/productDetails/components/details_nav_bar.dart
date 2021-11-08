import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';
import 'package:shopsta_app/views/cart/view.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsNavBar extends StatefulWidget {
  final bool isFavourite;
  final int productId;


  DetailsNavBar(this.isFavourite,this.productId);

  @override
  _DetailsNavBarState createState() => _DetailsNavBarState();
}

class _DetailsNavBarState extends State<DetailsNavBar> {

  bool isFavourite;

  // bool pressed =false;
  //
  // void onTapped() {
  //   setState(() {
  //     pressed=!pressed;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    isFavourite = widget.isFavourite;
    super.initState();
  }
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              FavoritesController().addProductToFav(widget.productId,context);
              setState(() {
                isFavourite= !isFavourite;
              });
            },
            icon: Icon(isFavourite? Icons.favorite:Icons.favorite_outline,color: kPrimaryColor,),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.60,
            height: 40,
            child: RaisedButton(
              onPressed: (){
                CartController()..addProductToCart(widget.productId,context);
              },
              textColor: Colors.white,
              child: Text('ProductDetails.addToCartButton'.tr().toString()),
              color: kPrimaryColor,

            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartView()
                  )
              );
            },
            icon: Icon(Icons.shopping_cart_outlined,color:kPrimaryColor,),
          ),
        ],
      ),
    );
  }
}
