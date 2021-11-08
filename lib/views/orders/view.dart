import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/orders/components/orders_listView.dart';
import 'package:shopsta_app/views/orders/controllers/controller.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersController = OrdersController()..getOrders();
    return BlocProvider(
      create: (context) => ordersController,
      child: Scaffold(
        appBar: homeAppBar(0.0,context,false,false),
        backgroundColor: Colors.white,
        body: OrdersListView(),
      ),
    );
  }
}
