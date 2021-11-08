import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItem extends StatelessWidget {
  String image;
  String url;


  SocialItem(this.image, this.url);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.network('$image',width: 30,height: 30,),
      onTap: () async{
        if (await canLaunch(url)) {
        await launch(url,forceSafariVC: false, forceWebView: false);
        } else {
        throw 'Could not launch $url';
        }
      },
    );
  }
}
