import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/changePassword/controllers/controller.dart';
import 'package:shopsta_app/views/changePassword/widgets/password_text_fields.dart';
import 'package:shopsta_app/views/changePassword/widgets/save_button.dart';
import 'package:shopsta_app/views/settings/view.dart';
import 'package:shopsta_app/widgets/app_bar.dart';
import 'package:shopsta_app/widgets/header.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=ChangePasswordController();
    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        key: controller.scaffoldState,
        appBar: homeAppBar(0.0, context,false,false),
        backgroundColor: Colors.white,
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
            children: [
              Header('ChangePasswordView.title'.tr().toString(),40),
              PasswordTextFields('ChangePasswordView.hintText1'.tr().toString(),textFieldController: controller.currentPasswordController,),
              PasswordTextFields('ChangePasswordView.hintText2'.tr().toString(),textFieldController: controller.newPasswordController,),
              PasswordTextFields('ChangePasswordView.hintText3'.tr().toString()),
              SaveButton('ChangePasswordView.saveButton'.tr().toString())
            ],
          ),
        ),
      ),
    );
  }
}
