import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/core/shared_helper.dart';

class LangOptions extends StatefulWidget {
  @override
  _LangOptionsState createState() => _LangOptionsState();
}

class _LangOptionsState extends State<LangOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
          child: Text('العربية', style: TextStyle(color: kPrimaryColor),),
          onPressed: (){
            setState(() {
              EasyLocalization.of(context).locale=Locale('ar','AR');
              SharedHelper.setLanguage('ar');
            });
          },

        ),
        FlatButton(
          child: Text('English', style: TextStyle(color: kPrimaryColor),),
          onPressed: (){
            setState(() {
              EasyLocalization.of(context).locale=Locale('en','EN');
              SharedHelper.setLanguage('en');
            });
          },

        )
      ],
    );
  }
}
