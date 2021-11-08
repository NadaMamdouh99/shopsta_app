import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/mainView/controllers/controller.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=MainViewController.of(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: controller.currentIndex,
      onTap: controller.changeIndex,
      selectedItemColor: kPrimaryColor,
      type: BottomNavigationBarType.fixed,
      items:[
        BottomNavigationBarItem(
          icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(0),
          label: controller.screens.map((e) => '${e[1]}').toList().elementAt(0).toString(),
        ),
        BottomNavigationBarItem(
          icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(1),
          label: controller.screens.map((e) => '${e[1]}').toList().elementAt(1).toString(),
        ),
        BottomNavigationBarItem(
          icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(2),
          label: controller.screens.map((e) => '${e[1]}').toList().elementAt(2).toString(),
        ),
        BottomNavigationBarItem(
          icon: controller.screens.map((e) => Icon(e[0])).toList().elementAt(3),
          label: controller.screens.map((e) => '${e[1]}').toList().elementAt(3).toString(),
        ),
        //controller.screens.map((e) => Icon(e[0])).toList().elementAt(controller.currentIndex),
        //controller.screens.map((e) => Text(e[1])).toList().elementAt(controller.currentIndex).toString(),
      ],


    );

  }
}
