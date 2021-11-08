import 'package:flutter/material.dart';
import 'package:shopsta_app/views/login/controllers/controller.dart';
import 'package:shopsta_app/widgets/custom_password_field.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final controller=LoginController.of(context);
  return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('login.emailText'.tr().toString(),Icons.email,TextInputType.emailAddress,textFieldController: controller.emailController,),
            CustomPasswordField(textFieldController: controller.passwordController,),
          ],
        ),
      ),
    );
  }
}
