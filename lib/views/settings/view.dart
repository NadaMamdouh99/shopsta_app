import 'package:flutter/material.dart';
import 'package:shopsta_app/views/settings/components/setting_header.dart';
import 'package:shopsta_app/views/settings/widgets/language_expansion_tile.dart';
import 'package:shopsta_app/views/settings/widgets/settings_list_tiles.dart';
import 'package:shopsta_app/views/splash/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsView extends StatelessWidget {

  List icons=[Icons.person_outline,Icons.lock_outline,Icons.edit_outlined];
  List titles=['SettingsView.profileInfo'.tr().toString(),'SettingsView.changePass'.tr().toString(),'SettingsView.editProfile'.tr().toString()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
        children: [
          SettingsHeader(),
          SettingsListTiles(icons,titles),
          LanguageExpansionTile(),
          Padding(
            padding: const EdgeInsets.only(left:35.0, right: 35),
            child: NavigationButton('SettingsView.logOutButton'.tr().toString(),(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashView())
              );
            },),
          ),
        ],
      ),
    );
  }
}
