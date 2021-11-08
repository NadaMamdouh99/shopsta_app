import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/login/states/controller.dart';
import 'package:shopsta_app/views/mainView/view.dart';

class LoginController extends Cubit<LoginStates> {
  LoginController() : super(LoginInit());


  static LoginController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();


  Future<void> login(BuildContext context) async{
    if(!formKey.currentState.validate()) return;
    emit(LoginLoading());
    try{
      final formData = ({
        'email': emailController.text,
        'password': passwordController.text,

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
        SharedHelper.setInfo(data['data']['token'], data['data']['id'], data['data']['email'],data['data']['name'], data['data']['phone'],data['data']['image']);
        print(SharedHelper.getToken);
        //print(data['data']['token']);
        print('succ  /// $data');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainView()));
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
    emit(LoginInit());
  }

}
