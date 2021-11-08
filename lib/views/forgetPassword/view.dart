import 'package:flutter/material.dart';
import 'package:shopsta_app/views/forgetPassword/component/forget_pass_form.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopsta_app/widgets/header.dart';

class ForgetPassView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        FadeAnimation(1
          ,ListView(
            padding: EdgeInsets.only(top: 180),
            children: [
              Header('forgetPassword.title'.tr().toString(), 35),
              ForgetPassForm(),
            ],
          ),
        ),
        "assets/images/main_top.png",
        "assets/images/login_bottom.png",
      ),
    );
  }
}
