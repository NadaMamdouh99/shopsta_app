import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/forgetPassword/view.dart';
import 'package:shopsta_app/views/login/view.dart';
import 'package:shopsta_app/views/signUp/view.dart';
import 'package:easy_localization/easy_localization.dart';

class HaveOrDontHaveAccount extends StatelessWidget {

  bool have;

  HaveOrDontHaveAccount(this.have);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              have ? 'login.checkHave'.tr().toString() : 'signUp.checkHave'.tr().toString() ,
              style: TextStyle(color: Colors.purple[200]),
            ),
            InkWell(
              onTap: have? (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpView())
                );
              }:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView())
                );
              },
              child: Text(
                have ?  'login.LOrS'.tr().toString(): 'signUp.LOrS'.tr().toString() ,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPassView())
            );
          },
          child: Text(
            have ? 'login.ForgetText'.tr().toString() : "",
            style: TextStyle(
              color: Colors.purple[200],
            ),
          ),
        )
      ],
    );
  }
}
