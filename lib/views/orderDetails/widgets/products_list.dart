import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orderDetails/models/order_details_model.dart';

class ProductsList extends StatelessWidget {
  List<Products> products;


  ProductsList(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 6,right: 6),
      padding: EdgeInsets.only(top: 10,left: 6,right: 6,bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black,blurRadius:0.5)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shopping_bag_outlined,color: kPrimaryColor,size: 30,),
              Text('Order List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
          products.isEmpty ? Center(child: Text('No Products ..'),) : ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(products[index].image,width: 50,height: 50,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(products[index].name,overflow: TextOverflow.ellipsis),
                          Text(products[index].price.toString()),
                        ],
                      ),
                    ),
                    SizedBox(width: 15,),
                    Text('x ${products[index].quantity.toString()}')
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
