import 'package:flutter/material.dart';
import 'package:shopsta_app/views/cart/controllers/controller.dart';
import 'package:shopsta_app/views/productDetails/components/details_sliver_list.dart';
import 'package:shopsta_app/views/productDetails/components/sliver_app_bar.dart';
import 'package:shopsta_app/views/productDetails/controllers/controller.dart';

class DetailsBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productDetailsController = ProductDetailsController.of(context);
    //final cartController = CartController();
    return CustomScrollView(
        slivers: [
          SliverBar(
              productDetailsController.productDetailsResult.data.images,
              productDetailsController.productDetailsResult.data.name
          ),
          DetailsSliverList(
              productDetailsController.productDetailsResult.data.name,
              productDetailsController.productDetailsResult.data.oldPrice.toString(),
              productDetailsController.productDetailsResult.data.price.toString(),
              productDetailsController.productDetailsResult.data.description,
              productDetailsController.productDetailsResult.data.discount,
              productDetailsController.productDetailsResult.data.id,
          ),
        ],
    );
  }
}
