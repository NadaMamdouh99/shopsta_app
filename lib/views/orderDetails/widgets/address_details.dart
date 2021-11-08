import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orderDetails/models/order_details_model.dart';

class AddressDetails extends StatelessWidget {
  Address address;

  AddressDetails(this.address);

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
              Icon(Icons.location_on_outlined,color: kPrimaryColor,size: 30,),
              Text('Delivery Location',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address.city),
                Text('${address.region} , ${address.details}'),
                Text(address.name)
              ],
            ),
          )
        ],
      ),
    );
  }
}
