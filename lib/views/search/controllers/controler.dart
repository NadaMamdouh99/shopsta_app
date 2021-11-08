import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/search/models/search_model.dart';
import 'package:shopsta_app/views/search/states/controller.dart';

class SearchController extends Cubit<SearchStates>{

  SearchController() : super(SearchInit());

  static SearchController of(context) => BlocProvider.of(context);
  TextEditingController searchField= new TextEditingController();

  SearchModel result;
  Future<void> getSearchResults() async{
    print('getting search results');
    emit(SearchLoading());
    try{
      final formData = ({
        'text': searchField.text,
      });
      final response=await Dio().post('https://student.valuxapps.com/api/products/search',
        data: formData,
        options: Options(
            contentType: 'application/json',
            method: 'POST',
            validateStatus: (state) => state < 500,
            headers: {
              'Authorization': '${SharedHelper.getToken}'
            }
        ),
      );
      final data = response.data as Map;
      if (data.containsValue(true)) {
        result= SearchModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting search data /// $data');
      }
      else {
        print('error when getting search data  /// $data');
        throw Exception('error when load Weather Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(SearchInit());
  }

}