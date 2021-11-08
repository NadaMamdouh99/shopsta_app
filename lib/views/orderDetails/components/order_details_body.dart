import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orderDetails/controllers/controller.dart';
import 'package:shopsta_app/views/orderDetails/states/controller.dart';
import 'package:shopsta_app/views/orderDetails/widgets/address_details.dart';
import 'package:shopsta_app/views/orderDetails/widgets/order_summary.dart';
import 'package:shopsta_app/views/orderDetails/widgets/products_list.dart';

class OrderDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderDetailsController = OrderDetailsController.of(context);
    return BlocBuilder(
      cubit: orderDetailsController,
      builder: (context,state) => state is OrderDetailsLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          )
      ):orderDetailsController.orderDetailsResult == null ? Center(child: Text('Loading ... '),): ListView(
        children: [
          AddressDetails(orderDetailsController.orderDetailsResult.data.address),
          ProductsList(orderDetailsController.orderDetailsResult.data.products),
          OrderSummary(orderDetailsController.orderDetailsResult.data)
        ],
      ),
    );
  }
}
