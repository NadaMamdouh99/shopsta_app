import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shopsta_app/views/checkOut/states/visa_payment_states.dart';

class VisaPaymentController extends Cubit<VisaPaymentStates> {

  VisaPaymentController() : super(VisaPaymentInit());

  static VisaPaymentController of(context) => BlocProvider.of(context);

  final formKey= GlobalKey<FormState>();
  TextEditingController cardHolderNameController=new TextEditingController();
  TextEditingController cardHolderNumberController=new TextEditingController();
  TextEditingController expirationMonthController=new TextEditingController();
  TextEditingController expirationYearController=new TextEditingController();
  TextEditingController ccvController=new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldState= new GlobalKey <ScaffoldState>();

  static const String _tokenUrl = 'https://api.sandbox.checkout.com/tokens';
  static const String _paymentUrl = 'https://api.sandbox.checkout.com/payments';

  static const String _secretKey = 'sk_test_43a61489-e70b-4198-9931-d10d6967d507';
  static const String _publicKey = 'pk_test_577f721a-7a6b-43fb-89ea-725dfaa0694f';

  static const Map<String, String> _tokenHeaders = {
    'Content-Type' : 'Application/json',
    'Authorization' : _publicKey,
  };

  static const Map<String, String> _paymentHeaders = {
    'Content-Type' : 'Application/json',
    'Authorization' : _secretKey,
  };


  String output = '';
  static String token;
  Future<void> getToken() async{
    if(!formKey.currentState.validate()) return;
    emit(VisaPaymentLoading());
    try{
    final body = ({
      'type' : 'card',
      'number' : cardHolderNumberController.text,
      'expiry_month' : expirationMonthController.text,
      'expiry_year' : expirationYearController.text,
      'cvv': ccvController.text,
      'name': cardHolderNameController.text,
    });
      final res = await Dio().post(_tokenUrl,
          data: body,
          options: Options(
            headers: {
              'Content-Type' : 'Application/json',
              'Authorization' : _publicKey,
            },
          )
      );
    final data = res.data as Map;
      if(res.statusCode == 201)
        {
          output = 'Validation Succeeded';
          print("success");
          token=data['token'];
          print(token);
        }
      else
        {
          output = 'Validation Failed';
          print('failed');
        }
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(VisaPaymentInit());
    // final http.Response response = await http.post(_tokenUrl, headers: _tokenHeaders, body: jsonEncode(body));
    // switch(response.statusCode){
    //   case 201:
    //     final decodedResponse = jsonDecode(response.body);
    //     return decodedResponse['token'];
    //     break;
    //   default:
    //     return 'Card Invalid';
    //     break;
    // }
  }

  static Future<bool> makePayment(double amount)async{
    //await getToken();
    //double vat = amount * 0.14;
    //amount = amount + vat;
    if(token == null)
      return false;
    try{
      final body = ({
       'source' : {
      'type' : 'token',
      'token' : token,
      },
      'amount' : amount,
      'currency' : 'USD',
      });
      final res = await Dio().post(_paymentUrl,
          data: body,
          options: Options(
            headers: {
              'Content-Type' : 'Application/json',
              'Authorization' : _secretKey,
            },
          )
      );
      print(res.data);
      if(res.statusCode == 201)
      {
        print("success");
        return true;
      }
      else
      {
        print('failed');
        return false;
      }
    }catch(e,s){
      print(e);
      print(s);
    }
    // if(token == null)
    //   return false;
    // Map<String, dynamic> body = {
    //   'source' : {
    //     'type' : 'token',
    //     'token' : token,
    //   },
    //   'amount' : amount,
    //   'currency' : 'USD',
    // };
    // final http.Response response = await http.post(_paymentUrl, headers: _paymentHeaders, body: jsonEncode(body));
    // switch(response.statusCode){
    //   case 201:
    //     return true;
    //     break;
    //   default:
    //     return false;
    //     break;
    // }
  }
}