import 'package:flutter/material.dart';
import 'package:shopsta_app/widgets/social_item.dart';

class SocialContacts extends StatelessWidget {

  List urls;

  SocialContacts(this.urls);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgw0J7sN6NIpPz7brTGjbby2V9isx82vWreA&usqp=CAU',urls[0]),
              SocialItem('https://www.pngrepo.com/png/13639/512/instagram.png',urls[1]),
              SocialItem('https://www.iconsdb.com/icons/preview/purple/snapchat-xxl.png',urls[2]),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialItem('https://logodix.com/logo/960048.jpg',urls[3]),
              SocialItem('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyvJmx6p8zGoAmAw74efEbH-AdeeU1gTFjNbm41UyHPlYQKZakbtD3vTehsHMy7_qSDBo&usqp=CAU',urls[4]),
              SocialItem('https://www.kindpng.com/picc/m/285-2857521_youtube-yt-pink-subscribe-freetoedit-purple-yt-logo.png',urls[5]),
            ],
          ),
        ],
      ),
    );
  }
}