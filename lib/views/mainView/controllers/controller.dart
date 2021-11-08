import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/category/view.dart';
import 'package:shopsta_app/views/favorite/view.dart';
import 'package:shopsta_app/views/home/view.dart';
import 'package:shopsta_app/views/mainView/states/states.dart';
import 'package:shopsta_app/views/settings/view.dart';
import 'package:easy_localization/easy_localization.dart';

class MainViewController extends Cubit<MainViewStates>{
  MainViewController() : super(MainViewInit());

  static MainViewController of(context) => BlocProvider.of(context);

  int currentIndex=0;

  final List<List<dynamic>> screens = [
    [Icons.home, 'BottomNavigationBar.home'.tr().toString(),HomeView()],
    [Icons.category, 'BottomNavigationBar.category'.tr().toString(),CategoryView()],
    [Icons.favorite, 'BottomNavigationBar.favourite'.tr().toString(),FavoriteView()],
    [Icons.settings, 'BottomNavigationBar.settings'.tr().toString(),SettingsView()],
  ];

  // final List<BottomNavigationBarItem> items=[
  //   BottomNavigationBarItem(
  //     icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(0),
  //     label: controller.screens.map((e) => '${e[1]}').toList().elementAt(0).toString(),
  //   ),
  //   BottomNavigationBarItem(
  //     icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(1),
  //     label: controller.screens.map((e) => '${e[1]}').toList().elementAt(1).toString(),
  //   ),
  //   BottomNavigationBarItem(
  //     icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(2),
  //     label: controller.screens.map((e) => '${e[1]}').toList().elementAt(2).toString(),
  //   ),
  //   BottomNavigationBarItem(
  //     icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(3),
  //     label: controller.screens.map((e) => '${e[1]}').toList().elementAt(3).toString(),
  //   ),
  // ];

  void changeIndex(int value) {
    if (currentIndex == value) return;
    currentIndex = value;
    emit(MainViewInit());
  }

  Widget get getCurrentView => screens[currentIndex][2];

}