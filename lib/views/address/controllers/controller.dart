import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/address/models/address_model.dart';
import 'package:shopsta_app/views/address/states/controller.dart';

class AddressController extends Cubit<AddressStates>{

  AddressController() : super(AddressInit());

  static AddressController of(context) => BlocProvider.of(context);

  AddressModel addressResult;
  Future<void> getAddresses() async{
    print('getting addresses');
    emit(AddressLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/addresses',
        options: Options(
            contentType: 'application/json',
            method: 'GET',
            validateStatus: (state) => state < 500,
            headers: {
              'Authorization': '${SharedHelper.getToken}',
              'lang': '${SharedHelper.getLanguageCode}'
            }
        ),
      );
      final data = response.data as Map;
      if (data['status']==true) {
        addressResult= AddressModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting addresses  /// $data');
      }
      else {
        print('error when getting addresses /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(AddressInit());
  }

  Future<void> deleteAddress(int id , context) async{
    //emit(CartLoading());
    try{
      final response = await Dio().delete(
          'https://student.valuxapps.com/api/addresses/$id',
          options: Options(
              contentType: 'application/json',
              method: 'DELETE',
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
        print('successfully deleted from address  /// $data');
        addressResult.data.addressData.removeWhere((element) => element.id == id);
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        emit(AddressInit());
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
    //emit(CartInit());
  }
}

