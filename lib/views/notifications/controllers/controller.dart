import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/home/models/banners_and_product_model.dart';
import 'package:shopsta_app/views/home/states/controller.dart';
import 'package:shopsta_app/views/notifications/models/notifications_model.dart';
import 'package:shopsta_app/views/notifications/states/controller.dart';

class NotificationsController extends Cubit<NotificationsStates>{

  NotificationsController() : super(NotificationsInit());

  static NotificationsController of(context) => BlocProvider.of(context);

  NotificationsModel notificationsModel;
  Future<void> getNotifications() async{
    print('getting notifications');
    emit(NotificationsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/notifications',
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
        notificationsModel= NotificationsModel.fromJson(data);
        //print(result.data.products[0]);
        print('successfully getting notification /// $data');
      }
      else {
        print('error when getting notification /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(NotificationsInit());
  }
}