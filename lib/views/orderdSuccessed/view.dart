import 'package:flutter/material.dart';
import 'package:shopsta_app/views/orderdSuccessed/components/order_successed_body.dart';
import 'package:shopsta_app/widgets/app_bar.dart';
import 'package:shopsta_app/widgets/drawer.dart';

class OrderSuccesedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(0.0, context, false, false),
      drawer: ShopstaDrawer(),
      body: OrderSuccessedBody(),
    );
  }
}
