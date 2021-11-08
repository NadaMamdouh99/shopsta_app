import 'package:flutter/material.dart';
import 'package:shopsta_app/views/signUp/controllers/controller.dart';
import 'package:shopsta_app/widgets/custom_password_field.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final controller= SignUpController.of(context);
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('signUp.nameText'.tr().toString(), Icons.person,TextInputType.name,textFieldController: controller.nameController,),
            CustomTextField('signUp.emailText'.tr().toString(),Icons.email,TextInputType.emailAddress,textFieldController:controller.emailController),
            CustomPasswordField(textFieldController:controller.passwordController),
            CustomTextField('signUp.phoneText'.tr().toString(),Icons.phone,TextInputType.phone,textFieldController:controller.phoneController),
          ],
        ),
      ),
    );
  }
}
