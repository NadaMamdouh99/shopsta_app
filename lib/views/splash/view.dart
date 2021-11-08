import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/views/signUp/view.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/views/splash/components/lang_options.dart';
import 'package:shopsta_app/views/splash/components/loading_spinkit.dart';
import 'package:shopsta_app/widgets/logo.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 10), SharedHelper.containsToken() ?
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainView()),
      ) : () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUpView()),
    ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FadeAnimation(1,Logo(200,200,400,50)),
          FadeAnimation(3,LangOptions()),
          FadeAnimation(5,LoadingSpinkit()),
        ],
      ),
    );
  }
}
