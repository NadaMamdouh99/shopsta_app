import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/orders/controllers/controller.dart';
import 'package:shopsta_app/views/orders/states/controller.dart';
import 'package:shopsta_app/views/orders/widgets/order_card.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:easy_localization/easy_localization.dart';

class OrdersListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersController = OrdersController.of(context);
    return BlocBuilder(
      cubit: ordersController,
      builder: (context, state) => state is OrdersLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          )
      ):ordersController.ordersResult == null ? AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false): ordersController.ordersResult.data.orderData.isEmpty ?
      AlternativeView('assets/images/empty_category.png','ErrorsMsgs.emptyOrders'.tr().toString(),true,false): RefreshIndicator(
        onRefresh: ordersController.getOrders,
        color: kPrimaryColor,
        child: ListView.builder(
                shrinkWrap: true,
                itemCount: ordersController.ordersResult.data.orderData.length,
                itemBuilder: (BuildContext context, int index){
                  return OrderCard(
                    ordersController.ordersResult.data.orderData[index],
                    ordersController
                  );
                },
              ),
      )
    );
  }
}
