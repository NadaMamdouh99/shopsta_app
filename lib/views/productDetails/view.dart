import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/productDetails/components/details_body.dart';
import 'package:shopsta_app/views/productDetails/components/details_nav_bar.dart';
import 'package:shopsta_app/views/productDetails/controllers/controller.dart';
import 'package:shopsta_app/views/productDetails/states/controller.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsView extends StatelessWidget {
  int id;
  DetailsView(this.id);

  @override
  Widget build(BuildContext context) {
    final productDetailsController = ProductDetailsController()..getProductDetails(id);
    return BlocProvider(
      create: (context)  => productDetailsController,
      child: BlocBuilder(
        cubit: productDetailsController,
        builder: (context,state) => state is ProductDetailsLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ),
          //heightFactor: 8,
        ): productDetailsController.productDetailsResult == null ? Scaffold(body: AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false)) : Scaffold(
            bottomNavigationBar: DetailsNavBar(
              productDetailsController.productDetailsResult.data.inFavorites,
              productDetailsController.productDetailsResult.data.id
            ),
            backgroundColor: Colors.white,
            body: DetailsBody(),
        ),
      ),
    );
  }
}
