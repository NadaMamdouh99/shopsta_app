import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:shopsta_app/views/productDetails/view.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final double price;
  final bool isFavourite;
  final String name;
  final int discount;
  final double oldPrice;
  final int productId;


  ProductCard(
      {this.image,
      this.price,
      this.isFavourite,
      this.name,
      this.discount,
      this.oldPrice,
      this.productId});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavourite;


  @override
  void initState() {
    // TODO: implement initState
    isFavourite=widget.isFavourite;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsView(widget.productId)
            )
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          /*border: Border.all(
                //color: Colors.black,
                width: 0.5,
              )
                 */
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(widget.image,width: 100,height: 100,fit: BoxFit.fill,),
                widget.discount == 0 ? SizedBox() :Container(
                  color: Colors.red,
                  child: Text('Discount ${widget.discount}%',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0, bottom: 5),
              child: Text(widget.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
            ),
            Expanded(
              child: Container(
                //width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize:MainAxisSize.max,
                  children: [
                    Text(widget.price.toString(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500,color: Colors.black,)),
                    SizedBox(width: 3,),
                    Text(widget.discount == 0 ?  "":widget.oldPrice.toString(),
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,color: Colors.grey
                        )
                    ),
                    //SizedBox(width: 3,),
                    IconButton(
                      onPressed: () {
                        FavoritesController().addProductToFav(widget.productId,context);
                        setState(() {
                          isFavourite= !isFavourite;
                        });
                      },
                      padding: const EdgeInsets.all(0),
                      icon: Icon(isFavourite ? Icons.favorite:Icons.favorite_outline,color: isFavourite ? kPrimaryColor:Colors.black,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
