import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/editProfile/controllers/controller.dart';
import 'package:shopsta_app/views/editProfile/states/controller.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class EditButton extends StatelessWidget {
  String title;

  EditButton(this.title);

  @override
  Widget build(BuildContext context) {
    final controller = EditProfileController.of(context);
    return BlocBuilder(
      cubit: controller,
      builder:(context,state) => state is EditProfileLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 2,
      )
        : NavigationButton(title, (){controller.edit(context);},)
      //     : Container(
      //   width: MediaQuery.of(context).size.width,
      //   margin: EdgeInsets.only(top: 5,bottom: 10,left: 22,right: 22),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(30),
      //     child: FlatButton(
      //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      //       color: kPrimaryColor,
      //       onPressed: (){
      //         controller.edit(context);
      //       },
      //       child: Text(
      //         title,
      //         style: TextStyle(color: kPrimaryLightColor),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}