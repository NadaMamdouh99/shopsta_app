import 'package:flutter/material.dart';
import 'package:shopsta_app/views/forgetPassword/widgets/custom_alert_dialog.dart';
import 'package:shopsta_app/views/login/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';
import 'package:shopsta_app/widgets/reset_button.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPassForm extends StatefulWidget {

  @override
  _ForgetPassFormState createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 50,horizontal: 10),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.network('https://www.interactivenw.com/wp-content/uploads/2012/04/IDreset-cir-icon-c.png',height: 80,width: 80,),
                Container(
                  width: 500,
                  height: 100,
                  child: CustomAlertDialog(),
                ),
                NavigationButton('forgetPassword.confirmButton'.tr().toString(), (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView())
                  );
                },),
                RichText(
                  text: TextSpan(
                      children: <TextSpan> [
                        TextSpan(
                            text: 'forgetPassword.resendMsg'.tr().toString(),
                            style: TextStyle(color: Colors.grey[600],fontSize: 12)),
                        TextSpan(
                            text: 'forgetPassword.seconds'.tr().toString(),
                            style: TextStyle(
                              color: Colors.deepPurple,
                            )),
                      ]
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('forgetPassword.emailText'.tr().toString(),Icons.email,TextInputType.emailAddress),
            ResetButton('forgetPassword.buttonText'.tr().toString(), _showMyDialog)
          ],
        ),
      ),
    );
  }
}
