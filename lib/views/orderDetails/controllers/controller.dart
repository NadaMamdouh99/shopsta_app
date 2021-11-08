import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/orderDetails/models/order_details_model.dart';
import 'package:shopsta_app/views/orderDetails/states/controller.dart';

class OrderDetailsController extends Cubit<OrderDetailsStates>{

  OrderDetailsController() : super(OrderDetailsInit());

  static OrderDetailsController of(context) => BlocProvider.of(context);

  OrderDetailsModel orderDetailsResult;
  Future<void> getOrderDetails(int id,context) async{
    print('getting order details');
    emit(OrderDetailsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/orders/$id',
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
        orderDetailsResult = OrderDetailsModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting order details  /// $data');
      }
      else {
        print('error when getting order details /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(OrderDetailsInit());
  }
}

