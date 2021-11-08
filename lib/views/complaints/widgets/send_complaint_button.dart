import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/views/complaints/controllers/controller.dart';
import 'package:shopsta_app/views/complaints/states/controller.dart';

class SendComplaintButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final complaintsController = ComplaintController.of(context);
    return BlocBuilder(
      cubit: complaintsController,
      builder:(context,state) => state is ComplaintLoading ? Center(
        child: CircularProgressIndicator(
          backgroundColor: kPrimaryLightColor,
          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
        ),
        heightFactor: 2,
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 5,bottom: 10,left: 22,right: 22),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            color: kPrimaryColor,
            onPressed: (){
              complaintsController.sendComplaint(context);
            },
            child: Text(
              'Send',
              style: TextStyle(color: kPrimaryLightColor),
            ),
          ),
        ),
      ),
    );
  }
}
