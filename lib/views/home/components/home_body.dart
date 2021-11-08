import 'package:flutter/material.dart';
import 'package:shopsta_app/views/home/components/slider.dart';
import 'package:shopsta_app/views/home/widgets/categories_listView.dart';
import 'package:shopsta_app/views/home/widgets/product_listView.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeBody extends StatelessWidget {

  ScrollController controller;
  HomeBody(this.controller);

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: controller,
        children: [
          CategoriesListView('HomeView.categoriesTitle'.tr().toString()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Text('HomeView.offers'.tr().toString(),style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold,), ),
          ),
          HomeSlider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Text('HomeView.products'.tr().toString(),style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold,), ),
          ),
          ProductListView(),
        ]
    );
  }
}
