import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/editProfile/view.dart';
import 'package:shopsta_app/views/login/components/login_form.dart';
import 'package:shopsta_app/views/login/controllers/controller.dart';
import 'package:shopsta_app/views/login/widgets/login_button.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';
import 'package:shopsta_app/widgets/have_or_dont_have_account.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopsta_app/widgets/header.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller= LoginController();
    return BlocProvider(
      create: (context) =>controller,
      child: Scaffold(
        key: controller.scaffoldState,
        body: Background(
          FadeAnimation(1
            ,ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
                Header('login.title'.tr().toString(), 50.0),
                LoginpForm(),
                LoginButton('login.buttonText'.tr().toString()),
                HaveOrDontHaveAccount(true),
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
