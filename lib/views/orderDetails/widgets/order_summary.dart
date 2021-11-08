import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orderDetails/models/order_details_model.dart';

class OrderSummary extends StatelessWidget {
  Data data;

  OrderSummary(this.data);

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
              Icon(Icons.description_outlined,color: kPrimaryColor,size: 30,),
              Text('Order Summary',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cost :'),
                    Text(data.cost.toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vat :'),
                    Text(data.vat.toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total :'),
                    Text(data.total.toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Method :'),
                    Text(data.paymentMethod,style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date :'),
                    Text(data.date,style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
