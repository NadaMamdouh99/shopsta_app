import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/cart/models/cart_model.dart';
import 'package:shopsta_app/views/cart/models/cart_update_model.dart';
import 'package:shopsta_app/views/cart/states/controllet.dart';

class CartController extends Cubit<CartStates>{

  CartController() : super(CartInit());

  static CartController of(context) => BlocProvider.of(context);

  double total;
  double subTotal;
  CartModel cartResult;
  Future<void> getCart() async{
    print('getting cart');
    emit(CartLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/carts',
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
        cartResult= CartModel.fromJson(data);
        SharedHelper.setCartCount(cartResult.data.cartItems.length.toString());
        total = cartResult.data.total;
        subTotal = cartResult.data.subTotal;
        //print(result.data.catdata[0].name);
        print('successfully getting cart /// $data');
      }
      else {
        print('error when getting cart  /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(CartInit());
  }

  //final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();
  Future<void> addProductToCart(int id, context) async{
    emit(CartLoading());
    try{
      final formData = ({
        'product_id': id,
      });

      final response = await Dio().post(
          'https://student.valuxapps.com/api/carts',
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
        print('successfully added to cart  /// $data');
        total = data['data']['total'];
        subTotal = data['data']['sub_total'];
        print('total after add : $total');
        emit(CartInit());
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
    emit(CartInit());
  }

  Future<void> deleteProductFromCart(int id , context, int index) async{
    //emit(CartLoading());
    try{
      final response = await Dio().delete(
          'https://student.valuxapps.com/api/carts/$id',
          options: Options(
              contentType: 'application/json',
              method: 'DELETE',
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
        print('successfully deleted from cart  /// $data');
        cartResult.data.cartItems.removeAt(index);
        SharedHelper.setCartCount(cartResult.data.cartItems.length.toString());
        //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        final net= (data['data']['cart']['product']['price'] * data['data']['cart']['quantity'] );
        print(net);
        //total = cartUpdateResult.data.total - net;
        total = cartResult.data.total - net;
        subTotal = cartResult.data.subTotal - (data['data']['cart']['product']['price'] * data['data']['cart']['quantity']);
        //subTotal = cartUpdateResult.data.subTotal - (data['data']['cart']['product']['price'] * data['data']['cart']['quantity']);
        print('total after delete : $total');
        print('quantity : ${ data['data']['cart']['quantity']}');
        emit(CartInit());
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

  CartUpdateModel cartUpdateResult;
  Future<void> updateCart(int id,int quantity,context) async{
    print('updating cart');
    //emit(CartLoading());
    try{
      final formData = ({
        'quantity': quantity,
      });
      final response=await Dio().put('https://student.valuxapps.com/api/carts/$id',
        data: formData,
        options: Options(
            contentType: 'application/json',
            method: 'PUT',
            validateStatus: (state) => state < 500,
            headers: {
              'Authorization': '${SharedHelper.getToken}'
            }
        ),
      );
      final data = response.data as Map;
      if (data.containsValue(true)) {
        cartUpdateResult= CartUpdateModel.fromJson(data);
        //print(result.data.catdata[0].name);
        print('successfully updating cart /// $data');
        total = cartUpdateResult.data.total;
        subTotal=cartUpdateResult.data.subTotal;
        print('total after update : $total');
        emit(CartInit());
      }
      else {
        print('error when updating cart  /// $data');
        throw Exception('error when load Data');
      }
      Scaffold.of(context).showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
    }
    catch(e,s){
      print(e);
      print(s);
    }
    //emit(CartInit());
  }
}