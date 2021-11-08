import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/categoryDetails/controllers/controller.dart';
import 'package:shopsta_app/views/categoryDetails/widgets/category_details_listView.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:shopsta_app/widgets/app_bar.dart';

class CategoryDetailsView extends StatelessWidget {
  int id;

  CategoryDetailsView(this.id);
  //final favController= FavoritesController().scaffoldState;
  @override
  Widget build(BuildContext context) {
    final categoryDetailsController= CategoryDetailsController()..getCategoryDetails(id);
    return BlocProvider(
      create: (context) => categoryDetailsController,
      child: Scaffold(
        backgroundColor: Colors.white,
        //key: categoryDetailsController.scaffoldState,
        appBar: homeAppBar(0.0,context,false,false),
        body: CategoryDetailsListView(),
      ),
    );
  }
}


