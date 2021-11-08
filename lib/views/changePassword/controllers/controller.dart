import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/changePassword/states/controller.dart';

class ChangePasswordController extends Cubit<ChangePasswordStates>{
  ChangePasswordController() : super(ChangePasswordInit());

  static ChangePasswordController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController currentPasswordController=new TextEditingController();
  TextEditingController newPasswordController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  Future<void> saveNewPassword(BuildContext context) async{
    if(!formKey.currentState.validate()) return;
    emit(ChangePasswordLoading());
    try{
      final formData = ({
        'current_password': currentPasswordController.text,
        'new_password': newPasswordController.text,

      });


      final response = await Dio().post(
          'https://student.valuxapps.com/api/change-password',
          data: formData,
          options: Options(
            contentType: 'application/json',
            method: 'POST',
            validateStatus: (state) => state < 500,
            headers: {
              'Authorization':'${SharedHelper.getToken}'
            }
          ),

      );
      final data = response.data as Map;
      if (data.containsValue(true))
      {
        print(data['data']['token']);
        print('succ  /// $data');
        scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        Future.delayed(Duration(seconds: 10),(){
          Navigator.pop(context);
        });
      }
      else
      {
        print('err ///   $data');
        scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
      }
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(ChangePasswordInit());
  }


}