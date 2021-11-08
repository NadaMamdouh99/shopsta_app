import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/favorite/models/favorites_model.dart';
import 'package:shopsta_app/views/favorite/states/controller.dart';

class FavoritesController extends Cubit<FavoritesStates>{

  FavoritesController() : super(FavoritesInit());

  static FavoritesController of(context) => BlocProvider.of(context);

  FavoritesModel result;
  Future<void> getFavorites() async{
    print('getting favorites');
    emit(FavoritesLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/favorites',
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
      if (data.containsValue(true)) {
        result= FavoritesModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting favorites /// $data');
      }
      else {
        print('error when getting favorites  /// $data');
        throw Exception('error when load Weather Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(FavoritesInit());
  }

  // final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();
  Future<void> addProductToFav(int id , context) async{
    emit(FavoritesLoading());
    try{
      final formData = ({
        'product_id': id,
      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/favorites',
          data: formData,
          options: Options(
            contentType: 'application/json',
            method: 'POST',
            validateStatus: (state) => state < 500,
            headers: {
                'Authorization': '${SharedHelper.getToken}'
            }
          )
      );
      final data = response.data as Map;
      if (data['status']==true)
      {
        print(response.data['message'].toString());
        print('successfully added to favorites  /// $data');
      }
      else
      {
        print('err ///   $data');
      }
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));


    }catch(e,s){
      print(e);
      print(s);
    }
    emit(FavoritesInit());
  }

  Future<void> deleteProductFromFav(int id,context) async{
    //emit(FavoritesLoading());
    try{
      final response = await Dio().delete(
          'https://student.valuxapps.com/api/favorites/$id',
          options: Options(
              contentType: 'application/json',
              method: 'POST',
              validateStatus: (state) => state < 500,
              headers: {
                'Authorization': '${SharedHelper.getToken}'
              }
          )
      );
      final data = response.data as Map;
      if (data['status']==true)
      {
        print(response.data['message'].toString());
        print('successfully added to favorites  /// $data');
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
    //emit(FavoritesInit());
  }
}