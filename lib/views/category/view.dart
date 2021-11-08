import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/category/widgets/categories_list_tiles.dart';
import 'package:shopsta_app/views/category/controllers/categories_controller.dart';
import 'package:shopsta_app/views/category/states/cat_controller.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryView extends StatelessWidget {
  //final favController= FavoritesController().scaffoldState;
  @override
  Widget build(BuildContext context) {
    final controller= CategoriesController.of(context);
    return BlocBuilder(
      cubit: controller,
      builder: (context,state) => state is CategoryLoading? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          )
      )
      :controller.result ==null ? AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false) : Scaffold(
        backgroundColor: Colors.white,
        //key: favController,
        body: CategoriesListTiles(),
      ),
    );
  }
}
