import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/views/orders/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderSuccessedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://img.freepik.com/free-vector/shopping-mobile-app-online-store-service-smartphone-application-internet-purchase-making-order-customer-cartoon-character-adding-product-cart-vector-isolated-concept-metaphor-illustration_335657-2836.jpg?size=338&ext=jpg'),
          SizedBox(height: 0,),
          Text('  Your Order is Successfully Completed !   ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          NavigationButton('Get Your Orders', (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrdersView()
                )
            );
          },)
        ],
      ),
    );
  }
}
