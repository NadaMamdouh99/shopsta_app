import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageExpansionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.only(top: 5,left: 6,right: 6,bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        boxShadow:[
          BoxShadow(color: Colors.grey,blurRadius: 0.5,offset: Offset.fromDirection(1))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right:11.0),
        child: ExpansionTile(
          backgroundColor:Colors.transparent,
          maintainState: true,
          childrenPadding: EdgeInsets.symmetric(horizontal: 42),
          title: Text('SettingsView.lang'.tr().toString(),style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.black,),),
          leading: Icon(Icons.language,color: kPrimaryColor,),
          trailing: Icon(Icons.arrow_forward_ios,color: kPrimaryColor,),
          children: [
            InkWell(
              child: Row(
                children: [
                  Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Flag_of_the_United_Kingdom_%282-3%29.svg/1200px-Flag_of_the_United_Kingdom_%282-3%29.svg.png',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 15,),
                  Text('Language.en'.tr().toString()),
                ],
              ),
              onTap: (){
                EasyLocalization.of(context).locale=Locale('en','EN');
                SharedHelper.setLanguage('en');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Flag_of_Saudi_Arabia.svg/2560px-Flag_of_Saudi_Arabia.svg.png',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(width: 15,),
                  Text('Language.ar'.tr().toString()),
                ],
              ),
              onTap: (){
                EasyLocalization.of(context).locale=Locale('ar','AR');
                SharedHelper.setLanguage('ar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
