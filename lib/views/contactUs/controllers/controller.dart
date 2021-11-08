import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/views/contactUs/models/contactUs_model.dart';
import 'package:shopsta_app/views/contactUs/states/controller.dart';

class ContactsController extends Cubit<ContactsStates>{

  ContactsController() : super(ContactsInit());

  static ContactsController of(context) => BlocProvider.of(context);

  ContactsModel contactsModel;
  Future<void> getContacts() async{
    print('getting contacts');
    emit(ContactsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/contacts',
        // options: Options(
        //     contentType: 'application/json',
        //     method: 'GET',
        //     validateStatus: (state) => state < 500,
        //     headers: {
        //       'Authorization': '${SharedHelper.getToken}'
        //     }
        // ),
      );
      final data = response.data as Map;
      if (data.containsValue(true)) {
        contactsModel= ContactsModel.fromJson(data);
        //print(result.data.products[0]);
        print('successfully getting contacts /// $data');
      }
      else {
        print('error when getting contacts /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(ContactsInit());
  }
}