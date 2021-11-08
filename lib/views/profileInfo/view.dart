import 'package:flutter/material.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/profileInfo/components/gender_toggle_button.dart';
import 'package:shopsta_app/views/profileInfo/widgets/profile_text_fields.dart';
import 'package:shopsta_app/widgets/app_bar.dart';
import 'package:shopsta_app/widgets/header.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(0.0,context,true,false),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
        children: [
          Header('ProfileInfoView.title'.tr().toString(),40),
          SizedBox(height: 20,),
          ProfileTextFields(Icons.email, '${SharedHelper.getEmail}', true),
          ProfileTextFields(Icons.person, '${SharedHelper.getName}', false),
          ProfileTextFields(Icons.phone, '${SharedHelper.getPhone}', false),
          GenderToggleButton(),
        ],
      ),
    );
  }
}
