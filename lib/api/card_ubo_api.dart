import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qrcode_card/models/http/user_response.dart';
import 'package:qrcode_card/service/local_storage.dart';
import 'package:qrcode_card/service/notification_service.dart';

class CardUboApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = 'http://salado.ubo.cl/api-qr-ubo/';

    //  _dio.options.headers ={
    //        'x-token' : LocalStorage.prefs.getString('token') ?? ''

    //  };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

              print('Codigo $resp.statusCode');
              print('Mensaje $resp.statusMessage');
              return resp.data;

         } catch (e) {
          print(e);
          throw e;
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
        NotificationService.showSnackbarError('Usuario no valido', Colors.red.withOpacity(0.9), Colors.white);
    }
  }
}
