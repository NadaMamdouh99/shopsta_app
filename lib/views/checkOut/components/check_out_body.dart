import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/address/models/address_model.dart';
import 'package:shopsta_app/views/checkOut/components/address_card.dart';
import 'package:shopsta_app/views/checkOut/components/payment_options.dart';
import 'package:shopsta_app/views/checkOut/controllers/controller.dart';
import 'package:shopsta_app/views/checkOut/states/controller.dart';
import 'package:shopsta_app/views/checkOut/widgets/payment_summary.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class CheckOutBody extends StatelessWidget {
  String subTotal;
  String total;
  //AddressData addressData;

  CheckOutBody({this.subTotal, this.total});

  @override
  Widget build(BuildContext context) {
    final checkOutController = CheckOutController.of(context);
    return BlocBuilder(
      cubit: checkOutController,
      builder:(context,state) => ListView(
        children: [
          AddressCard(checkOutController.address),
          PaymentOptions(checkOutController),
          PaymentSummary(
            subTotal: subTotal,
            total: total,
          ),
          state is CheckOutLoading ? Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryLightColor,
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              )
          ):NavigationButton('Check Out', (){
            checkOutController.addOrder(context, checkOutController.address.id, 1,double.parse(total));
          })
        ],
      ),
    );
  }
}
