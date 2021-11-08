import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/const/colors/colors.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/editProfile/controllers/controller.dart';

class EditPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final editProfileController = EditProfileController.of(context);
    return BlocBuilder(
      cubit: editProfileController,
      builder: (context, state) => Center(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: editProfileController.file == null ?
              NetworkImage('${SharedHelper.getImage}') : FileImage(editProfileController.file),
              radius: 50,
            ),
            Positioned(
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                child: IconButton(
                  icon: Icon(Icons.edit),color: Colors.white,iconSize:15,
                  onPressed: (){
                    editProfileController.pickPhoto();
                  },
                ),
                radius: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
