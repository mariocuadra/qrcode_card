



import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';

class UploadService{


  Future<void>  uploadImage (String path, Uint8List bytes, String id) async
 {
   
  

//    Uint8List imageInUnit8List = // store unit8List image here ;
// final tempDir = await getTemporaryDirectory();
// File file = await File('${tempDir.path}/image.png').create();
// file.writeAsBytesSync(imageInUnit8List);

    final formData = FormData.fromMap({
          'id' :  id,
          'file' : MultipartFile.fromBytes(bytes, filename: 'imagen.png'),
                     
        
    });

    try{
      

      var dio = Dio();

      final resp = await dio.post(path, data: formData, options: Options(responseType: ResponseType.bytes));

        print(resp);

        return resp.data;

    } on DioError catch (e){
      print(e);
      throw('Error en el PUT $e');
    }
 }
}