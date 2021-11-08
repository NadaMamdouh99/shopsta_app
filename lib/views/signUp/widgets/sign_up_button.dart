import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/login/view.dart';
import 'package:shopsta_app/views/signUp/controllers/controller.dart';
import 'package:shopsta_app/views/signUp/states/controller.dart';
import 'package:shopsta_app/widgets/navigation_button.dart';

class SignUpButton extends StatelessWidget {
  String title;


  SignUpButton(this.title);

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.of(context);
    return BlocConsumer(
      cubit: controller,
      listener: (context, state) {
        if (state is SignUpSuccess){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
        }
        else if (state is SignUpError) {
          controller.scaffoldState.currentState.showSnackBar(new SnackBar(content: Text('error, please try again')));
        }
      },
      builder:(context,state) => state is SignUpLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 2,
      ) : NavigationButton(title,(){controller.signUp();})
      // : Container(
      //   width: MediaQuery.of(context).size.width,
      //   margin: EdgeInsets.only(top: 5,bottom: 10,left: 22,right: 22),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(30),
      //     child: FlatButton(
      //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      //       color: kPrimaryColor,
      //       onPressed: (){
      //         controller.signUp();
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
