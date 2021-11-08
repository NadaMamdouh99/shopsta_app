import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/home/models/banners_and_product_model.dart';
import 'package:shopsta_app/views/home/states/controller.dart';

class HomeController extends Cubit<HomeStates>{

  HomeController() : super(HomeInit());

  static HomeController of(context) => BlocProvider.of(context);

  final scrollController = ScrollController();

  BannersAndProductsModel result;
  Future<void> getBannersAndProducts() async{
    print('getting banners and products');
    emit(HomeLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/home',
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
        result= BannersAndProductsModel.fromJson(data);
        print('${SharedHelper.getToken}');
        //print(result.data.products[0]);
        print('successfully getting banners and products /// $data');
      }
      else {
        print('error when getting banners and products /// $data');
        throw Exception('error when load Weather Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(HomeInit());
  }
}