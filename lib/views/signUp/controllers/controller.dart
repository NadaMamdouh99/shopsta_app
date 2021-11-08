import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/signUp/states/controller.dart';

class SignUpController extends Cubit<SignUpStates> {
  SignUpController() : super(SignUpInit());

  static SignUpController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController nameController=new TextEditingController();
  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();
  

  Future<void> signUp() async{
    if(!formKey.currentState.validate()) return;
    emit(SignUpLoading());
    try{
      final formData = ({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text,

      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/register',
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
        emit(SignUpSuccess());
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
      }
      else
      {
        print('err ///   $data');
        emit(SignUpError());
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text('error, please try again')));
      }


    }catch(e,s){
      print(e);
      print(s);
    }
    emit(SignUpInit());
  }

}
