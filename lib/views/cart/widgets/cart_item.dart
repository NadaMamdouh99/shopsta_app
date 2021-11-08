import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';


class CartItem extends StatefulWidget {

  final String image;
  final double price;
  final String name;
  final int quantity;
  final int productId;
  final int id;
  final int index;
  final CartController controller;


  CartItem({this.image, this.price, this.name, this.quantity,this.productId,this.id,this.index,this.controller});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  int quantity;
  @override
  void initState() {
    // TODO: implement initState
    quantity = widget.quantity;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 6,right: 6),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(widget.image,height: 100,width: 100,fit: BoxFit.fill),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.name,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black)),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline_rounded,color: quantity==1 ? Colors.grey:kPrimaryColor,size: 20,),
                                onPressed: () {
                                  if(quantity > 1) {
                                    setState(() {
                                      quantity--;
                                      widget.controller.updateCart(widget.id, quantity,context);
                                    });
                                  }
                                },
                              ),
                              Text(quantity.toString(),style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black)),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline_rounded,color: kPrimaryColor,size: 20,),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                    widget.controller.updateCart(widget.id, quantity,context);
                                  });
                                },
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_shopping_cart_rounded,color: kPrimaryColor),
                            onPressed: (){
                              widget.controller.deleteProductFromCart(widget.id,context,widget.index);
                             //widget.controller.cartResult.data.cartItems.removeAt(widget.index);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Row(
            //         children: [
            //           IconButton(
            //             icon: Icon(Icons.remove_circle_outline_rounded,color: counter==0 ? Colors.grey:kPrimaryColor,size: 20,),
            //             onPressed: () => onplusTapped(index),
            //           ),
            //           Text(cartController.cartResult.data.cartItems[index].quantity.toString(),style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black)),
            //           IconButton(
            //             icon: Icon(Icons.add_circle_outline_rounded,color: kPrimaryColor,size: 20,),
            //             onPressed: () => onplusTapped(index),
            //           ),
            //         ],
            //       ),
            //       IconButton(icon: Icon(Icons.remove_shopping_cart_rounded,color: kPrimaryColor), onPressed: (){})
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
