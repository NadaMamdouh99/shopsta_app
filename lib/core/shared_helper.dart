import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper{
  // Null
  static SharedPreferences _sharedPreferences;

  static void init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setToken(String value) {
    _sharedPreferences.setString('token', value);
  }

  static void setId(String value) {
    _sharedPreferences.setString('id', value);
  }
  static void setLanguage(String code) {
    _sharedPreferences.setString('lang', code);
  }

  static void setCartCount(String value) {
    _sharedPreferences.setString('count', value);
  }

  static void setInfo(String token,int id,String email, String name,String phone,String image) {
    _sharedPreferences.setString('token', token);
    _sharedPreferences.setInt('id', id);
    _sharedPreferences.setString('email', email);
    _sharedPreferences.setString('name', name);
    _sharedPreferences.setString('phone', phone);
    _sharedPreferences.setString('image', image);
    print('Info Stored Successfully');
  }

  // static void setEmail(String value) {
  //   _sharedPreferences.setString('email', value);
  // }
  //
  // static void setPhone(String value) {
  //   _sharedPreferences.setString('phone', value);
  // }
  //
  // static void setname(String value) {
  //   _sharedPreferences.setString('name', value);
  // }
  //
  // static void setImage(String value) {
  //   _sharedPreferences.setString('image', value);
  // }

  static bool containsId() {
    return _sharedPreferences.containsKey('id');
  }

  static bool containsToken() {
    return _sharedPreferences.containsKey('token');
  }

  /*static void removeId() {
    _sharedPreferences.remove('idToken');
  }*/

  static void removeInfo() {
    _sharedPreferences.remove('token');
    _sharedPreferences.remove('id');
    _sharedPreferences.remove('email');
    _sharedPreferences.remove('name');
    _sharedPreferences.remove('phone');
    _sharedPreferences.remove('iamge');
  }

  static String get getToken {
    return _sharedPreferences.getString('token');
  }

  static int get getId {
    return _sharedPreferences.getInt('id');
  }

  static String get getEmail {
    return _sharedPreferences.getString('email');
  }
  static String get getName {
    return _sharedPreferences.getString('name');
  }

  static String get getImage {
    return _sharedPreferences.getString('image');
  }

  static String get getPhone {
    return _sharedPreferences.getString('phone');
  }

  static String get getLanguageCode {
    return _sharedPreferences.getString('lang');
  }

  static String get getCartCount {
    return _sharedPreferences.getString('count');
  }
}