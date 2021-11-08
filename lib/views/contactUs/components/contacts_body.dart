import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/contactUs/widgets/about_info.dart';
import 'package:shopsta_app/views/contactUs/controllers/controller.dart';
import 'package:shopsta_app/views/contactUs/states/controller.dart';
import 'package:shopsta_app/views/contactUs/widgets/social_contacts.dart';
import 'package:shopsta_app/views/signUp/components/divider.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/logo.dart';

class ContactsBody extends StatelessWidget {
  GlobalKey<ScaffoldState> _key;
  ContactsBody(this._key);
  @override
  Widget build(BuildContext context) {
    final contactsController = ContactsController.of(context);
    return BlocBuilder(
      cubit: contactsController,
      builder:(context,state) => state is ContactsLoading ? Center(
          child: CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ))
      : FadeAnimation(
        1, Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10.0,top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(icon: Icon(Icons.menu,color: Colors.black54,), onPressed: () {
                  _key.currentState.openDrawer();
                },
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
          Text(
            'Contact Us',
            style: TextStyle(color: Colors.purple[300],
                fontSize: 50,fontFamily:'DancingScript',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Logo(80, 80,180, 30),
          SocialContacts([
            contactsController.contactsModel.data.contactsData[0].value,
            contactsController.contactsModel.data.contactsData[1].value,
            contactsController.contactsModel.data.contactsData[6].value,
            contactsController.contactsModel.data.contactsData[2].value,
            contactsController.contactsModel.data.contactsData[5].value,
            contactsController.contactsModel.data.contactsData[7].value,
          ]),
          SignUpDivider(),
          AboutInfo(
            contactsController.contactsModel.data.contactsData[8].value,
            contactsController.contactsModel.data.contactsData[3].value,
            contactsController.contactsModel.data.contactsData[4].value,
          ),
        ],
      )
      ),
    );
  }
}
