import 'package:flutter/material.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/views/terms/components/terms_body.dart';
import 'package:shopsta_app/widgets/background.dart';

class TermsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        FadeAnimation(1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Terms & Conditions',style: TextStyle(color: Colors.purple[300],fontSize: 40,fontFamily:'DancingScript',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              TermsBody(),
            ],
          ),
        ),
        "assets/images/main_top.png",
        "assets/images/login_bottom.png",
      ),
    );
  }
}
