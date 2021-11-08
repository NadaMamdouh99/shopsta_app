import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class GenderToggleButton extends StatefulWidget {
  @override
  _GenderToggleButtonState createState() => _GenderToggleButtonState();
}

class _GenderToggleButtonState extends State<GenderToggleButton> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10,horizontal:15 ),
      child: FlutterToggleTab(
        borderRadius: 10,
        width: 87,
        initialIndex: 0,
        selectedIndex: currentIndex,
        selectedBackgroundColors: [
          kPrimaryColor,
        ],
        selectedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
        unSelectedTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),
        labels: ['ProfileInfoView.maleToggle'.tr(),'ProfileInfoView.femaleToggle'.tr()],
        icons: [Icons.person,Icons.pregnant_woman],
        selectedLabelIndex: (index) {
          setState(() {
            currentIndex=index;
          });
        },
      ),
    );
  }
}
