import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/addAdress/components/add_address_form.dart';
import 'package:shopsta_app/views/addAdress/controllers/controller.dart';
import 'package:shopsta_app/views/addAdress/widgets/add_address_button.dart';
import 'package:shopsta_app/views/address/controllers/controller.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';

class AddAddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addAddressController = AddAddressController();
    return BlocProvider(
      create: (context) => addAddressController,
      child: Scaffold(
        key: addAddressController.scaffoldState,
        body: Background(
          FadeAnimation(1,
            ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
                Text('Add Address',style: TextStyle(color: Colors.purple[300],fontSize: 50,fontFamily:'DancingScript',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                AddAddressForm(),
                AddAddressButton(),
                //NavigationButton('Send', MainView()),
              ],
            ),
          ),
          "assets/images/main_top.png",
          "assets/images/login_bottom.png",
        ),
      ),
    );
  }
}
