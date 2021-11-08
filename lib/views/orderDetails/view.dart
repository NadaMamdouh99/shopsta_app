import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/orderDetails/components/order_details_body.dart';
import 'package:shopsta_app/views/orderDetails/controllers/controller.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class OrderDetailsView extends StatelessWidget {
  int id;


  OrderDetailsView(this.id);

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = OrderDetailsController()..getOrderDetails(id, context);
    return  BlocProvider(
      create: (context) => orderDetailsController,
      child: Scaffold(
        appBar: homeAppBar(0.0,context,false,false),
        backgroundColor: Colors.white,
        body: OrderDetailsBody(),
      ),
    );
  }
}
