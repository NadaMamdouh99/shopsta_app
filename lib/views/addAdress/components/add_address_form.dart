import 'package:flutter/material.dart';
import 'package:shopsta_app/views/addAdress/controllers/controller.dart';
import 'package:shopsta_app/views/complaints/widgets/complaint_text_field.dart';
import 'package:shopsta_app/widgets/custom_text_field.dart';

class AddAddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addAddressController = AddAddressController.of(context);
    return Form(
      key: addAddressController.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: Column(
          children: [
            CustomTextField('Name', Icons.person,TextInputType.text,textFieldController: addAddressController.nameController,),
            CustomTextField('City',Icons.location_city,TextInputType.text,textFieldController: addAddressController.cityController,),
            CustomTextField('Region',Icons.add_location_alt,TextInputType.text,textFieldController: addAddressController.regionController,),
            CustomTextField('Details',Icons.details,TextInputType.text,textFieldController: addAddressController.detailsController),
            ComplaintTextField('Notes',Icons.assignment,TextInputType.text,addAddressController.notesController)
          ],
        ),
      ),
    );
  }
}
