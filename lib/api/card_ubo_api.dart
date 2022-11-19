
import 'package:dio/dio.dart';
import 'package:qrcode_card/models/http/user_response.dart';
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


 static Future<List<UserResponse>> fetchUser(String emailuser) async {
  // ModelUser user= ModelUser(idcard: 'idcard', nombre: 'nombre', appaterno: 'appaterno', cargo: 'cargo', direccion: 'direccion', telefono: 'telefono', email: 'email');

  List<UserResponse> users = [];

  try {
    await CardUboApi.httpGet('findperson/$emailuser').then((jsonString) {
      for (var u in jsonString) {
        UserResponse user = UserResponse(
            idcard: u["idcard"],
            nombre: u["nombre"],
            appaterno: u["appaterno"],
            cargo: u["cargo"],
            direccion: u["direccion"],
            telefono: u["telefono"],
            email: u["email"]);

        users.add(user);
      }
    });

    return users;
  } catch (e) {
    
    throw e;
  }
}

}