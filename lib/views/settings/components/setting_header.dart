import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/core/shared_helper.dart';

class SettingsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage('${SharedHelper.getImage}'),
          radius: 50,
        ),
        Text('${SharedHelper.getName}', style: TextStyle(fontSize: 25,color: kPrimaryColor),)
      ],
    );
  }
}
