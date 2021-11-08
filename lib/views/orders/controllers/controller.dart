import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/orders/models/orders_model.dart';
import 'package:shopsta_app/views/orders/states/controller.dart';

class OrdersController extends Cubit<OrdersStates>{

  OrdersController() : super(OrdersInit());

  static OrdersController of(context) => BlocProvider.of(context);

  //final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  OrdersModel ordersResult;
  Future<void> getOrders() async{
    print('getting orders');
    emit(OrdersLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/orders',
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
        ordersResult= OrdersModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully getting orders  /// $data');
      }
      else {
        print('error when getting orders /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(OrdersInit());
  }

  Future<void> deleteAddress(int id , context) async{
    //emit(CartLoading());
    try{
      final response = await Dio().get(
          'https://student.valuxapps.com/api/orders/$id/cancel',
          options: Options(
              contentType: 'application/json',
              method: 'GET',
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
        ordersResult.data.orderData.removeWhere((element) => element.id == id);
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        emit(OrdersInit());
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

