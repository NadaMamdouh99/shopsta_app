import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/address/models/address_model.dart';
import 'package:shopsta_app/views/checkOut/controllers/visa_payment_controller.dart';
import 'package:shopsta_app/views/checkOut/states/controller.dart';
import 'package:shopsta_app/views/orderdSuccessed/view.dart';
import 'package:shopsta_app/views/orders/view.dart';

class CheckOutController extends Cubit<CheckOutStates>{
  CheckOutController() : super(CheckOutInit());

  static CheckOutController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController cardHolderNameController=new TextEditingController();
  TextEditingController cardHolderNumberController=new TextEditingController();
  TextEditingController expirationController=new TextEditingController();
  TextEditingController ccvController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();
  int valueSelected = 0;

  AddressData address;
  void selectAddress(AddressData value){
    address = value;
    emit(CheckOutInit());
  }

  Future<void> addOrder(context,int addressId,int methodId,double total) async {
      //if(!formKey.currentState.validate()) return;
    //await VisaPaymentController().token;
    try {
    bool isSuccess;
    print(valueSelected);
    if(valueSelected == 2){
      isSuccess = await VisaPaymentController.makePayment(total);
      print(isSuccess);
      if(isSuccess == false || isSuccess == null) {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: Text('Please fill your visa info')));
        return;
      }
    }
      emit(CheckOutLoading());
        final formData = ({
          'address_id': addressId,
          'payment_method': valueSelected,
          'use_points': false,
          'promo_code_id': 0,
        });

        final response = await Dio().post(
            'https://student.valuxapps.com/api/orders',
            data: formData,
            options: Options(
                contentType: 'application/json',
                method: 'POST',
                validateStatus: (state) => state < 500,
                headers: {
                  'Authorization': '${SharedHelper.getToken}',
                  'lang': '${SharedHelper.getLanguageCode}'
                }
            )
        );
        final data = response.data as Map;
        if (data['status'] == true) {
          print(response.data['message'].toString());
          print('successfully added to your orders  /// $data');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderSuccesedView()));
          //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        }
        else {
          print('err ///   $data');
          //scaffoldState.currentState.showSnackBar(new SnackBar(content: Text(response.data['message'].toString())));
        }
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: Text(response.data['message'].toString())));
      } catch (e, s) {
        print(e);
        print(s);
      }
      emit(CheckOutInit());
    }
}