import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orderDetails/view.dart';
import 'package:shopsta_app/views/orders/controllers/controller.dart';
import 'package:shopsta_app/views/orders/models/orders_model.dart';

class OrderCard extends StatelessWidget {

  OrderData ordersData;
  OrdersController ordersController;


  OrderCard(this.ordersData,this.ordersController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,left: 6,right: 6),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height/4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
          padding: const EdgeInsets.only(top: 12.0,bottom: 12,left: 8,right: 8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  color: kPrimaryColor,
                  onPressed: (){
                    ordersController.deleteAddress(ordersData.id, context);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status',style: TextStyle(fontSize: 16,),),
                  Text(ordersData.status, style: TextStyle(fontSize: 16,color: Colors.black87),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: TextStyle(fontSize: 16,),),
                  Text(ordersData.total.toString(), style: TextStyle(fontSize: 16,color: Colors.black87),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Date',style: TextStyle(fontSize: 16,),),
                  Text(ordersData.date, style: TextStyle(fontSize: 16,color: Colors.black87),)
                ],
              ),
              Divider(thickness: 2,),
              TextButton(
                child: Text('Tab to view more details',style: TextStyle(color: kPrimaryColor),textAlign: TextAlign.center,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsView(ordersData.id)));
                },
              )
            ],
          )
      ),
    );
  }
}
