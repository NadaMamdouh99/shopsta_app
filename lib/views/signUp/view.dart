import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/login/view.dart';
import 'package:shopsta_app/views/signUp/components/divider.dart';
import 'package:shopsta_app/views/signUp/components/sign_up_form.dart';
import 'package:shopsta_app/views/signUp/components/social_buttons.dart';
import 'package:shopsta_app/views/signUp/controllers/controller.dart';
import 'package:shopsta_app/views/signUp/widgets/sign_up_button.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';
import 'package:shopsta_app/widgets/have_or_dont_have_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopsta_app/widgets/header.dart';


class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=SignUpController();
    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        key: controller.scaffoldState,
        body: Background(
          FadeAnimation(1
            ,ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
              Header('signUp.title'.tr().toString(),50.0),
              SignUpForm(),
              SignUpButton('signUp.buttonText'.tr().toString()),
              HaveOrDontHaveAccount(false),
              SignUpDivider(),
              SocialButtons(),
            ],
            ),
          ),
          "assets/images/main_top.png",
          "assets/images/login_bottom.png",
        ),
      ),
    );
  }
}
