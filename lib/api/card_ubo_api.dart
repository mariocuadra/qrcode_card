import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_card/models/http/user_response.dart';
import 'package:qrcode_card/service/notification_service.dart';

class CardUboApi {
  static final Dio _dio = Dio();

     static void configureDio() {
    _dio.options.baseUrl = 'https://credencial.ubo.cl/';
    print(_dio.options.baseUrl);
    //_dio.options.baseUrl = 'http://192.168.202.50/api-qr-ubo/';
   // _dio.options.baseUrl = 'https://10.16.3.178/api-qr-ubo/';
   
    _dio.options.headers['content-Type'] = 'application/json';



  }


  static Future httpGet(String path) async {
    try {
    

      final resp = await _dio.get(path);

      return resp.data;
    } on DioError catch (e) {
        
        return e.response;


    }
  }

  static Future fetchUser(String emailuser) async {
    UserResponse user;
    try {
      final res = await CardUboApi.httpGet('findperson/$emailuser');

      user = UserResponse.fromJson(res);

      return user;
    } catch (e) {
      print('error al consultar el usuario $e');
      NotificationService.showSnackbarError(
          'Usuario no valido', Colors.red.withOpacity(0.9), Colors.white);
    }
  }
}
