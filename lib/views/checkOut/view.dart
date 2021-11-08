import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/checkOut/components/check_out_body.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';
import 'package:shopsta_app/views/checkOut/states/controller.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class CheckOutView extends StatelessWidget {
  String subTotal;
  String total;


  CheckOutView({this.subTotal, this.total});

  @override
  Widget build(BuildContext context) {
    final checkOutController = CheckOutController();
    return  BlocProvider(
      create: (context) => checkOutController,
      child: Scaffold(
        key: checkOutController.scaffoldState,
        //bottomNavigationBar: ,
        appBar: homeAppBar(0.0,context,false,false),
        backgroundColor: Colors.white,
        body:CheckOutBody(
            subTotal: subTotal,
            total: total,
            //addressData: checkOutController.address,
          )
      )
    );
  }
}


// BlocBuilder<CheckOutController,CheckOutStates>(
// builder: (context,state) {
// final checkOutController = CheckOutController.of(context);
// return