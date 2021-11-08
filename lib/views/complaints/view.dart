import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/complaints/components/complaints_form.dart';
import 'package:shopsta_app/views/complaints/controllers/controller.dart';
import 'package:shopsta_app/views/complaints/widgets/send_complaint_button.dart';
import 'package:shopsta_app/views/splash/animation/fade_animation.dart';
import 'package:shopsta_app/widgets/background.dart';

class ComplaintsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final complaintsController = ComplaintController();
    return BlocProvider(
      create: (context) => complaintsController,
      child: Scaffold(
        key: complaintsController.scaffoldState,
        body: Background(
          FadeAnimation(1,
            ListView(
              padding: EdgeInsets.only(top: 80),
              children: [
                Text('Complaints',style: TextStyle(color: Colors.purple[300],fontSize: 50,fontFamily:'DancingScript',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ComplaintsForm(),
                SendComplaintButton(),
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
