import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/addAdress/states/controller.dart';
import 'package:shopsta_app/views/address/view.dart';

class AddAddressController extends Cubit<AddAddressStates>{

  AddAddressController() : super(AddAddressInit());

  static AddAddressController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController nameController=new TextEditingController();
  TextEditingController cityController=new TextEditingController();
  TextEditingController regionController=new TextEditingController();
  TextEditingController detailsController=new TextEditingController();
  TextEditingController notesController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  Future<void> addAddress(context) async{
    if(!formKey.currentState.validate()) return;
    emit(AddAddressLoading());
    try{
      final formData = ({
        'name': nameController.text,
        'city': cityController.text,
        'region': regionController.text,
        'details': detailsController.text,
        'latitude': 0,
        'longitude': 0,
        'notes': notesController.text,
      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/addresses',
          data: formData,
          options: Options(
              contentType: 'application/json',
              method: 'POST',
              validateStatus: (state) => state < 500,
              headers: {
                'Authorization': '${SharedHelper.getToken}',
                'lang': '${SharedHelper.getLanguageCode}'
              }
          )
      );
      final data = response.data as Map;
      if (data['status']==true)
      {
        print(response.data['message'].toString());
        print('successfully added to addresses  /// $data');
        Future.delayed(Duration(seconds: 7),(){
          Navigator.pop(context);
        });
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
      }
      else
      {
        print('err ///   $data');
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
      }
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));


    }catch(e,s){
      print(e);
      print(s);
    }
    emit(AddAddressInit());
  }
}

