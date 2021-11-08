import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';

class PriceAndAddingItemsRow extends StatefulWidget {
  String prePrice;
  String price;
  int discount;
  int id;


  PriceAndAddingItemsRow(this.prePrice, this.price,this.discount,this.id);

  @override
  _PriceAndAddingItemsRowState createState() => _PriceAndAddingItemsRowState();
}

class _PriceAndAddingItemsRowState extends State<PriceAndAddingItemsRow> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline_rounded,color: counter==1 ? Colors.grey:kPrimaryColor,size: 30,),
              onPressed: (){
                setState(() {
                  counter--;
                  if(counter < 1){
                    counter=1;
                  }
                });
                CartController().updateCart(widget.id, counter,context);
              },
            ),
            Text('$counter',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400,color: Colors.black)),
            IconButton(
              icon: Icon(Icons.add_circle_outline_rounded,color: kPrimaryColor,size: 30,),
              onPressed: (){
                setState(() {
                  counter++;
                });
                CartController().updateCart(widget.id, counter,context);
              },
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.discount == 0 ? "" : widget.prePrice+'\$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,color: Colors.grey),),
              Text('    '),
              Text(widget.price+'\$', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
