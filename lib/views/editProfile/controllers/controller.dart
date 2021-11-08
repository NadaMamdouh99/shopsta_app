import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/editProfile/states/controller.dart';

class EditProfileController extends Cubit<EditProfileStates> {
  EditProfileController() : super(EditProfileInit());

  static EditProfileController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController nameController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  Future<void> edit(BuildContext context) async{
    if(!formKey.currentState.validate()) return;
    emit(EditProfileLoading());

    try{
      final formData = ({
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        if (file != null) 'image': base64Encode(file.readAsBytesSync())

      });
      
      final response=await Dio().put(
          'https://student.valuxapps.com/api/update-profile',
          data: formData,
          options: Options(
            contentType: 'application/json',
            method: 'PUT',
            validateStatus: (state) => state < 500,
            headers: {
              'Authorization': '${SharedHelper.getToken}'
            }
          )
      );


      final data = response.data as Map;
      if (data.containsValue(true))
      {
        SharedHelper.setInfo(data['data']['token'], data['data']['id'], data['data']['email'], data['data']['name'], data['data']['phone'], data['data']['image']);
        print(data['data']['token']);
        print('succ  /// $data');
        scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        Future.delayed(Duration(seconds: 10),(){
          Navigator.pop(context);
        });
      }
      else
      {
        print(data['token']);
        print('err ///   $data');
        scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));

      }

    }catch(e,s){
      print(e);
      print(s);
    }
    emit(EditProfileInit());
  }

  File file;
  void pickPhoto() async {
    final pickedFile =
    await ImagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    file = File(pickedFile.path);
    emit(EditProfileInit());
  }

}