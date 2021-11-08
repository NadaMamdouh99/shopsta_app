import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/addAdress/controllers/controller.dart';
import 'package:shopsta_app/views/addAdress/states/controller.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class AddAddressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addAddressController = AddAddressController.of(context);
    return BlocBuilder(
      cubit: addAddressController,
      builder:(context,state) => state is AddAddressLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 2,
      )
          : NavigationButton('Add',(){addAddressController.addAddress(context);},)
    );
  }
}
