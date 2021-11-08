import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:5,bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Divider(
              color:kPrimaryLightColor,
              thickness: 1.5,
              indent: 30,
            ),
          ),
          Text(' '+'signUp.Div'.tr().toString()+' ',style: TextStyle(color: kPrimaryColor),),
          Expanded(
            child: Divider(
              color:kPrimaryLightColor,
              thickness: 1.5,
              endIndent: 30,
            ),
          ),
          //Text('OR'),

        ],
      ),
    );
  }
}
