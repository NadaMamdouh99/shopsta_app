import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/cart/components/cart_nav_bar.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';
import 'package:shopsta_app/views/cart/states/controllet.dart';
import 'package:shopsta_app/views/cart/widgets/cart_item.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:easy_localization/easy_localization.dart';

class CartListView extends StatefulWidget {

  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  int counter=1;
  int currentIndex=0;

  void onplusTapped(int index) {
    setState(() {
      currentIndex = index;
      counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.of(context);
    return BlocBuilder(
      cubit: cartController,
      builder: (context,state) => state is CartLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          )
      ):cartController.cartResult == null ? AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false) : cartController.cartResult.data.cartItems.isEmpty ?
      AlternativeView('https://assets.materialup.com/uploads/87d4df96-a55f-4f4b-9a17-a696eded97f3/preview.gif', 'ErrorsMsgs.emptyCart'.tr().toString(), false, true): Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CartNavBar(
          subTotal: cartController.subTotal.toString(),
          total: cartController.total.toString()
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: cartController.cartResult.data.cartItems.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return CartItem(
                productId: cartController.cartResult.data.cartItems[index].product.id,
                name: cartController.cartResult.data.cartItems[index].product.name,
                price: cartController.cartResult.data.cartItems[index].product.price,
                image: cartController.cartResult.data.cartItems[index].product.image,
                quantity: cartController.cartResult.data.cartItems[index].quantity,
                id: cartController.cartResult.data.cartItems[index].id,
                index: index,
                controller: cartController,
              );
            }
        ),
      ),
    );
  }
}
