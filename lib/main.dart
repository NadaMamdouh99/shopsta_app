import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/category/controllers/categories_controller.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/views/splash/view.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedHelper.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(EasyLocalization(
      child: MyApp(),
    path: "assets/langs",
    saveLocale: true,
    supportedLocales: [
      Locale('en','EN'),
      Locale('ar','AR'),
    ],
  ));
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller= CategoriesController()..getCategories();
    return BlocProvider(
      create: (context) => controller,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: SplashView(),
        //SharedHelper.containsToken() ? MainView():SplashView()
      ),
    );
  }
}


// final controller= CategoriesController()..getCategories();
// return BlocProvider(
// create: (context) => controller,
// child: