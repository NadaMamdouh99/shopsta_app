import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/categoryDetails/models/category_details_model.dart';
import 'package:shopsta_app/views/categoryDetails/states/controller.dart';

class CategoryDetailsController extends Cubit<CategoryDetailsStates>{

  CategoryDetailsController() : super(CategoryDetailsInit());

  static CategoryDetailsController of(context) => BlocProvider.of(context);

  //final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  CategoryDetailsModel result;
  Future<void> getCategoryDetails(int id) async{
    print('getting categories details');
    emit(CategoryDetailsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/categories/$id',
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
        result= CategoryDetailsModel.fromJson(data);
        //print(result.data.catData[0].name);
        print('successfully getting categories details  /// $data');
      }
      else {
        print('error when getting categories details  /// $data');
        throw Exception('error when load Weather Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(CategoryDetailsInit());
  }
}