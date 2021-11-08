import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shopsta_app/views/login/view.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class CustomAlertDialog extends StatefulWidget {

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextEditingController controller = TextEditingController();
  String thisText = "";
  int pinLength = 4;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                //child: Text(thisText, style: Theme.of(context).textTheme.title),
              ),
              PinCodeTextField(
                pinBoxRadius: 5,
                autofocus: false,
                controller: controller,
                hideCharacter: false,
                highlight: true,
                highlightColor: Colors.white,
                defaultBorderColor: Colors.grey[200],
                hasTextBorderColor: Colors.green,
                maxLength: pinLength,
                hasError: hasError,
                onTextChanged: (text) {
                  setState(() {
                    hasError = false;
                  });
                },
                onDone: (text){
                  print("DONE $text");
                },
                //pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                wrapAlignment: WrapAlignment.center,
                pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextStyle: TextStyle(fontSize: 30.0),
                pinBoxWidth: 40,
                pinBoxHeight: 50,
                pinBoxOuterPadding: EdgeInsets.only(left: 8,right: 8,top: 8),
                pinBoxBorderWidth: 0,
                keyboardType: TextInputType.number,
                highlightPinBoxColor: Colors.white,
                pinBoxColor: Colors.grey[200],
                pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
              ),
              Visibility(
                child: Text(
                  "Wrong PIN!",
                  style: TextStyle(color: Colors.red),
                ),
                visible: hasError,
              ),
            ],
          ),
        )
    );
  }
}
