import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/favorite/controllers/controller.dart';
import 'package:shopsta_app/views/mainView/components/navigation_bar.dart';
import 'package:shopsta_app/views/mainView/controllers/controller.dart';
import 'package:shopsta_app/views/mainView/states/states.dart';
import 'package:shopsta_app/widgets/app_bar.dart';
import 'package:shopsta_app/widgets/drawer.dart';

class MainView extends StatefulWidget {

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  //final favController= FavoritesController().scaffoldState;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewController(),
      child: BlocBuilder<MainViewController,MainViewStates> (
        builder: (context,state) => Scaffold(
          //key: favController,
          backgroundColor: Colors.white,
          appBar: homeAppBar(0.0,context,false,false),
          drawer: ShopstaDrawer(),
          bottomNavigationBar: NavigationBar(),
          body: MainViewController.of(context).getCurrentView,
      )
      ),
    );
  }
}


// int _currentIndex =0;
//
// List<Widget> _children = [
//   HomeView(),
//   CategoryView(),
//   FavoriteView(),
//   SettingsView()
// ];
//
// void onTabTapped(int index) {
//   setState(() {
//     _currentIndex = index;
//   });
// }

// bottomNavigationBar: BottomNavigationBar(
//   onTap: onTabTapped,
//   currentIndex: _currentIndex,
//   items: [
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.category),
//       label: 'Category',
//     ),
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.favorite),
//       label: 'Favorite',
//     ),
//     new BottomNavigationBarItem(
//       icon: Icon(Icons.settings),
//       label: 'Settings',
//     )
//   ],
//   //backgroundColor: kPrimaryLightColor,
//   selectedItemColor: kPrimaryColor,
//   type: BottomNavigationBarType.fixed,
// ),