import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:shopsta_app/views/productDetails/view.dart';

class FavoritesListTiles extends StatefulWidget {
  @override
  _FavoritesListTilesState createState() => _FavoritesListTilesState();
}

class _FavoritesListTilesState extends State<FavoritesListTiles> {

  bool pressed =false;
  int _currentIndex =0;
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
      pressed=!pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller= FavoritesController.of(context);
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.result.data.favdata.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
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
            child: InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsView(controller.result.data.favdata[index].product.id)
                    )
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 8,right: 8),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image.network(controller.result.data.favdata[index].product.image,width: 100,height: 100,fit: BoxFit.fill,),
                        controller.result.data.favdata[index].product.discount == 0 ? SizedBox() :Container(
                          color: Colors.red,
                          child: Text('Discount ${controller.result.data.favdata[index].product.discount}%',style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8),
                        child: Column(
                          children: [
                            Text(controller.result.data.favdata[index].product.name,overflow: TextOverflow.clip,textAlign: TextAlign.center ,),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.result.data.favdata[index].product.price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black)),
                                  Text(controller.result.data.favdata[index].product.discount == 0 ? "":controller.result.data.favdata[index].product.oldPrice.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,color: Colors.grey)),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentIndex = index;
                                        pressed=!pressed;
                                      });
                                      controller.deleteProductFromFav(controller.result.data.favdata[index].id,context);
                                      controller.result.data.favdata.removeAt(index);
                                    },
                                  icon: Icon(_currentIndex==index && pressed ? Icons.favorite_outline:Icons.favorite,color: _currentIndex==index && pressed ?Colors.black:kPrimaryColor,),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
