import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/editProfile/components/edit_form.dart';
import 'package:shopsta_app/views/editProfile/components/edit_photo.dart';
import 'package:shopsta_app/views/editProfile/controllers/controller.dart';
import 'package:shopsta_app/views/editProfile/widgets/edit_button.dart';
import 'package:shopsta_app/views/mainView/view.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';
import 'package:easy_localization/easy_localization.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller= EditProfileController();
    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        key: controller.scaffoldState,
        body: Background(
          FadeAnimation(1
            ,ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
                EditPhoto(),
                Text('editProfile.title'.tr().toString(),style: TextStyle(color: Colors.purple[300],fontSize: 40,fontFamily:'DancingScript',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                EditForm(),
                EditButton('editProfile.buttonText'.tr().toString()),
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
