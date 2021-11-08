import 'package:flutter/material.dart';
import 'package:shopsta_app/views/editProfile/controllers/controller.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';

class EditForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller=EditProfileController.of(context);
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('editProfile.nameText'.tr().toString(), Icons.person,TextInputType.name,textFieldController: controller.nameController,),
            CustomTextField('editProfile.emailText'.tr().toString(),Icons.email,TextInputType.emailAddress,textFieldController: controller.emailController,),
            CustomTextField('editProfile.phoneText'.tr().toString(),Icons.phone,TextInputType.phone,textFieldController: controller.phoneController,),
          ],
        ),
      ),
    );
  }
}
