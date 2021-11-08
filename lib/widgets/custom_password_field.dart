import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomPasswordField extends StatefulWidget {
  TextEditingController textFieldController;


  CustomPasswordField({this.textFieldController});

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool visiblePassword=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.85,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: visiblePassword,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_rounded,
            color: kPrimaryColor,
          ),
          hintText: 'signUp.passwordText'.tr().toString(),
          border: InputBorder.none,
          fillColor: kPrimaryLightColor,
          suffixIcon: IconButton(
            color: kPrimaryColor,
            icon: visiblePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: ()  {
              setState(() {
                visiblePassword=!visiblePassword;
              });
            },
          )
        ),
        validator: (value) {
          if(value.isEmpty) return 'password can\'t be empty';
          else if (value.length < 4) return 'The password must be more than 4 char';
          else return null;
        },
        controller: widget.textFieldController,
      ),
    );
  }
}
