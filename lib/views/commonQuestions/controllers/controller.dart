import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsta_app/core/shared_helper.dart';
import 'package:shopsta_app/views/commonQuestions/models/model.dart';
import 'package:shopsta_app/views/commonQuestions/states/controller.dart';
import 'package:shopsta_app/views/home/models/banners_and_product_model.dart';
import 'package:shopsta_app/views/home/states/controller.dart';
import 'package:shopsta_app/views/notifications/models/notifications_model.dart';
import 'package:shopsta_app/views/notifications/states/controller.dart';

class FAQsController extends Cubit<FAQsStates>{

  FAQsController() : super(FAQsInit());

  static FAQsController of(context) => BlocProvider.of(context);

  FAQsModel faQsModel;
  Future<void> getFAQs() async{
    print('getting FAQs');
    emit(FAQsLoading());
    try{
      final response=await Dio().get('https://student.valuxapps.com/api/faqs',
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
        faQsModel= FAQsModel.fromJson(data);
        //print(result.data.products[0]);
        print('successfully getting FAQs /// $data');
      }
      else {
        print('error when getting FAQs /// $data');
        throw Exception('error when load Data');
      }
    }
    catch(e,s){
      print(e);
      print(s);
    }
    emit(FAQsInit());
  }
}