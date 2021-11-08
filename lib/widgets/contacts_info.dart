import 'package:flutter/material.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsInfo extends StatelessWidget {
  IconData icon;
  String content;
  String url;


  ContactsInfo(this.icon, this.content, this.url);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: kPrimaryColor),
        TextButton(
          child: Text(content,style: TextStyle(color: Colors.black54),),
          onPressed: () async{
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ],
    );
  }
}
