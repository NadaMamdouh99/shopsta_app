import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/complaints/states/controller.dart';
import 'package:shopsta_app/views/mainView/view.dart';

class ComplaintController extends Cubit<ComplaintStates> {
  ComplaintController() : super(ComplaintInit());


  static ComplaintController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController emailController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  TextEditingController nameController=new TextEditingController();
  TextEditingController complaintController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();


  Future<void> sendComplaint(context) async{
    if(!formKey.currentState.validate()) return;
    emit(ComplaintLoading());
    try{
      final formData = ({
        'email': emailController.text,
        'name': nameController.text,
        'phone': phoneController.text,
        'message': complaintController.text,

      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/complaints',
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
    emit(ComplaintInit());
  }

}
