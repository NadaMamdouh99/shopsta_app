import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/categoryDetails/models/category_details_model.dart';
import 'package:shopsta_app/views/categoryDetails/states/controller.dart';
import 'package:shopsta_app/views/productDetails/models/product_details_model.dart';
import 'package:shopsta_app/views/productDetails/states/controller.dart';

class ProductDetailsController extends Cubit<ProductDetailsStates>{

  ProductDetailsController() : super(ProductDetailsInit());

  static ProductDetailsController of(context) => BlocProvider.of(context);

  ProductDetailsModel productDetailsResult;
  Future<void> getProductDetails(int id) async{
    print('getting product details');
    emit(ProductDetailsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/products/$id',
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
        productDetailsResult= ProductDetailsModel.fromJson(data);
        //print(result.data.catData[0].name);
        print('successfully getting product details  /// $data');
      }
      else {
        print('error when getting product details  /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(ProductDetailsInit());
  }
}