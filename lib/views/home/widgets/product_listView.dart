import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/home/states/controller.dart';
import 'package:shopsta_app/views/productDetails/view.dart';
import 'package:shopsta_app/views/home/controllers/controller.dart';
import 'package:shopsta_app/widgets/product_card.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.of(context);
    return BlocBuilder(
      cubit: homeController,
      builder: (context,state) => state is HomeLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 4,
      ):homeController.result == null ? Center(child: Text('Error when getting data'),) : GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: homeController.result.data.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7
        ),
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            image: homeController.result.data.products[index].image,
            name: homeController.result.data.products[index].name,
            price: homeController.result.data.products[index].price,
            oldPrice: homeController.result.data.products[index].oldPrice,
            discount: homeController.result.data.products[index].discount,
            isFavourite: homeController.result.data.products[index].inFavorites,
            productId: homeController.result.data.products[index].id,
          );
        },
      ),
    );
  }
}


// bool pressed =false;
//
// int _currentIndex =0;
// void onTapped(int index) {
//   setState(() {
//     _currentIndex = index;
//     pressed=!pressed;
//   });
// }


/*
        crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.image.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(widget.image[index]),
                      Text(widget.title[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(widget.price, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: Colors.black)),
                              Text(widget.prePrice, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough,color: Colors.grey[300])),
                            ],
                          ),
                          IconButton(
                            icon: Icon(pressed ? Icons.favorite:Icons.favorite_outline,color: pressed ? kPrimaryColor:Colors.black,),
                            onPressed: (){
                              setState(() {
                                pressed=!pressed;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],

         */