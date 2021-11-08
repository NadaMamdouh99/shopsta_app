import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';
import 'package:shopsta_app/views/cart/widgets/cart_listView.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartController = CartController()..getCart();
    return BlocProvider(
      create: (context) => cartController,
      child: Scaffold(
        //key: cartController.scaffoldState,
        //bottomNavigationBar: ,
        appBar: homeAppBar(0.0,context,false,true),
        backgroundColor: Colors.white,
        body: CartListView(),
      ),
    );
  }
}
