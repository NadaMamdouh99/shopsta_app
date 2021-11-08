import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/contactUs/widgets/about_info.dart';
import 'package:shopsta_app/views/contactUs/components/contacts_body.dart';
import 'package:shopsta_app/views/contactUs/controllers/controller.dart';
import 'package:shopsta_app/widgets/background.dart';
import 'package:shopsta_app/widgets/drawer.dart';

class ContactUsView extends StatelessWidget{
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final contactsController = ContactsController()..getContacts();
    return BlocProvider(
      create: (context) => contactsController,
      child: Scaffold(
        key: _scaffoldState,
        drawer: ShopstaDrawer(),
        body: Background(
           SingleChildScrollView(
             child: ContactsBody(_scaffoldState),
           ),
          "assets/images/main_top.png",
          "assets/images/login_bottom.png",
        ),
      ),
    );
  }
}
