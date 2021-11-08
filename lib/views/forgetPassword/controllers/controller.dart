import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/forgetPassword/states/controller.dart';
import 'package:shopsta_app/views/login/view.dart';

class ForgetPasswordController extends Cubit<ForgetPasswordStates> {
  ForgetPasswordController() : super(ForgetPasswordInit());

  static ForgetPasswordController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController emailController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  Future<void> resetPassword(BuildContext context) async{
    if(!formKey.currentState.validate()) return;
    emit(ForgetPasswordLoading());
    try{
      final formData = ({
        'email': emailController.text,

      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/login',
          data: formData,
          options: Options(
            contentType: 'application/json',
            method: 'POST',
            validateStatus: (state) => state < 500,
          )
      );
      final data = response.data as Map;
      if (data.containsValue(true))
      {
        print('succ  /// $data');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
      }
      else
      {
        print('err ///   $data');
        scaffoldState.currentState.showSnackBar(new SnackBar(content: Text('error, please try again')));
      }


    }catch(e,s){
      print(e);
      print(s);
    }
    emit(ForgetPasswordInit());
  }


}