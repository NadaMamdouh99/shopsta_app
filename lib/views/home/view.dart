import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/home/components/home_body.dart';
import 'package:shopsta_app/views/home/controllers/controller.dart';
import 'package:shopsta_app/widgets/scroll_app_bar.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final homeController= HomeController()..getBannersAndProducts();
    return BlocProvider(
      create: (context) => homeController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ScrollingAppBar(homeController.scrollController),
        body: HomeBody(homeController.scrollController),
        ),
    );
  }
}


// BlocBuilder <HomeController,HomeStates>(
// builder: (context,state) => state is HomeLoading && state is CategoryLoading ? Center(
// child: CircularProgressIndicator(
// backgroundColor: kPrimaryLightColor,
// valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
// ),
// //heightFactor: 8,
// ):


// List images=['https://rb-traders.com/wp-content/uploads/2020/10/58102-1-1540.jpg',
//   'https://www.bankrate.com/2020/08/01170557/How-to-save-money-on-groceries.jpeg',
//   'https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg',
//   'https://www.foodbusinessnews.net/ext/resources/2021/6/MichelsBakeryProducts_Lead.jpg?t=1623330828&width=1080',
//   'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
//   'https://rb-traders.com/wp-content/uploads/2020/10/58102-1-1540.jpg',
//   'https://www.bankrate.com/2020/08/01170557/How-to-save-money-on-groceries.jpeg',
//   'https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg',
//   'https://www.foodbusinessnews.net/ext/resources/2021/6/MichelsBakeryProducts_Lead.jpg?t=1623330828&width=1080',
//   'https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
// ];
//
// List titles=['Food','Grocries','Fast Food','Bakeries','Healthy', 'Food','Grocries','Fast Food','Bakeries','Healthy'];