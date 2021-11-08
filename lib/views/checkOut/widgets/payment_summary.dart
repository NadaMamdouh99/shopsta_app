import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  String subTotal;
  String  total;


  PaymentSummary({this.subTotal, this.total});
  @override
  Widget build(BuildContext context) {
    double vat = double.parse(subTotal) * 0.14;
    double newTotal = double.parse(total) + vat;
    return Container(
      padding: const EdgeInsets.only(top: 15.0,bottom: 12,left: 8,right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Summary ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SubTotal',style: TextStyle(fontSize: 16,),),
                    Text('$subTotal', style: TextStyle(fontSize: 16,color: Colors.black87),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Vat',style: TextStyle(fontSize: 16,),),
                    Text('$vat', style: TextStyle(fontSize: 16,color: Colors.black87),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
                    Text('$newTotal', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black87),)
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
