import 'package:flutter/material.dart';
import 'package:shopsta_app/views/complaints/controllers/controller.dart';
import 'package:shopsta_app/views/complaints/widgets/complaint_text_field.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';

class ComplaintsForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final complaintsController = ComplaintController.of(context);
    return Form(
      key: complaintsController.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('Name', Icons.person,TextInputType.name,textFieldController: complaintsController.nameController,),
            CustomTextField('Email',Icons.email,TextInputType.emailAddress,textFieldController: complaintsController.emailController,),
            CustomTextField('Phone',Icons.phone,TextInputType.phone,textFieldController: complaintsController.phoneController,),
            ComplaintTextField('Your Complaint',Icons.assignment,TextInputType.text,complaintsController.complaintController)
          ],
        ),
      ),
    );
  }
}
