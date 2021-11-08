import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:shopsta_app/views/favorite/states/controller.dart';
import 'package:shopsta_app/views/favorite/widgets/favorites_list_tiles.dart';
import 'package:shopsta_app/widgets/alternative_view.dart';
import 'package:easy_localization/easy_localization.dart';


class FavoriteView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller= FavoritesController()..getFavorites();
    return BlocProvider(
      create:(context) =>controller,
      child: BlocBuilder(
          cubit: controller,
          builder: (context,state) => state is FavoritesLoading? Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryLightColor,
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
              )
          ):controller.result == null ? AlternativeView('https://image.freepik.com/vecteurs-libre/avertissement-erreur-concept-systeme-exploitation-illustration-vectorielle-page-web-erreur-404-systeme-exploitation-fenetre-avertissement-erreur_126608-442.jpg', 'ErrorsMsgs.errorWhenLoadPage'.tr().toString(), false,false) :Scaffold(
            backgroundColor: Colors.white,
            //key: controller.scaffoldState,
            body: FavoritesListTiles()
        ),
      ),
    );
  }
}
