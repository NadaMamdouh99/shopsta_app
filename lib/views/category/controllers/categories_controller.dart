import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/category/models/categories_model.dart';
import 'package:shopsta_app/views/category/states/cat_controller.dart';
import 'package:shopsta_app/views/home/states/controller.dart';

class CategoriesController extends Cubit<CategoryStates>{

  CategoriesController() : super(CategoryInit());

  static CategoriesController of(context) => BlocProvider.of(context);

  CategoriesModel result;
  Future<void> getCategories() async{
    print('getting categories');
    emit(CategoryLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/categories',
        options: Options(
            contentType: 'application/json',
            method: 'GET',
            validateStatus: (state) => state < 500,
            headers: {
              'lang': '${SharedHelper.getLanguageCode}'
            }
        ),
      );
      final data = response.data as Map;
      if (data.containsValue(true)) {
        result= CategoriesModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting categories  /// $data');
      }
      else {
        print('error when getting categories  /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(CategoryInit());
  }
}