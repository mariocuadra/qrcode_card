

import 'package:dio/dio.dart';
import 'package:qrcode_card/service/local_storage.dart';


class CardUboApi{



  static final Dio _dio = Dio();

  static void configureDio(){

    _dio.options.baseUrl ='http://localhost:3000/';


    _dio.options.headers ={
          'x-token' : LocalStorage.prefs.getString('token') ?? ''

    };    

   
  }

  static Future httpGet(String path) async{

    try{
        final resp = await _dio.get(path);
        

        return resp.data;
        
       
    }catch(e){
      throw('Error en el GET : $e');
    }

  }


}