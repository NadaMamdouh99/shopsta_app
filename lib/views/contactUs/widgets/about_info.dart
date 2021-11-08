import 'package:flutter/material.dart';
import 'package:shopsta_app/widgets/contacts_info.dart';

class AboutInfo extends StatelessWidget {
  String email;
  String phone;
  String website;


  AboutInfo(this.website,this.email, this.phone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40,right: 40,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContactsInfo(Icons.public,website,'$website'),
          ContactsInfo(Icons.email,email,'mailto:$email?subject=Test&body=This email for'),
          ContactsInfo(Icons.phone, phone, 'tel:$phone'),
        ],
      ),
    );
  }
}
