import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_card/models/http/models_user.dart';
import 'package:qrcode_card/service/local_storage.dart';
import 'package:qrcode_card/shared/custom_input.dart';
import 'api/card_ubo_api.dart';
import 'dart:html' as html;

void main() async {
  await LocalStorage.configurePrefs();
  CardUboApi.configureDio();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  final myController = TextEditingController();

  void _printLatestValue() {}
}

class _MyAppState extends State<MyApp> {
  String data = '';
  String emailuser = '';
  String idpersona ="0"; 
  String nombre ="nombre";
  String appaterno ="apellido";
  String cargo ="cargo";
  String direccion ="direccion";
  


  String urlhost ='http://localhost:64053';
  List<ModelUser> users = [];
  TextEditingController nameController = TextEditingController();
  late QrPainter _painter;
  GlobalKey globalKey = GlobalKey();
  int size = 1;
  
 
  @override
  Widget build(BuildContext context) {
    _painter = QrPainter(
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Color(0xff128760),
      ),
      data: json.encode(data),
      version: QrVersions.auto,
    );

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Column(
          children: <Widget>[
            CustomPaint(
                size: Size.square((size * 100).toDouble()),
                key: globalKey,
                painter: _painter),
            CustomInput(
              nameController: nameController,
            ),
            TextButton(
              child: const Text('QR'),
              onPressed: () {
                // print(nameController.text);

                setState(() {
                  emailuser = nameController.text;
                });

                CardUboApi.httpGet('findperson/$emailuser').then((jsonString) {
                 users = [];

                  for (var u in jsonString) {
                    ModelUser user = ModelUser(
                        id: u["idcard"],
                        nombre: u["nombre"],
                        appaterno: u["appaterno"],
                        cargo: u["cargo"],
                        direccion: u["direccion"],
                        telefono: u["telefono"],
                        email: u["email"]);
                    users.add(user);

                    idpersona =users[0].id;
                    nombre=users[0].nombre;
                    appaterno=users[0].appaterno;
                    cargo = users[0].cargo;
                    direccion=users[0].direccion;


                    print(users[0].id);

                  }

                  if (users.isEmpty) {
                    setState(() {
                      data = 'invalido';
                      print(data);
                    });
                  } else {
                    setState(() {
                      String url ='http://localhost:58853/?para1=$idpersona&para2=$emailuser&para3=$nombre&para4=$appaterno&para5=$cargo&para6=$direccion';
                      data = url;
                     
                      
                    });
                  }
                }).catchError((e) {
                  print('error en: $e');
                });
              },
            ),
              TextButton(
              child: Text("CARD"),
              onPressed: () { 

                  openLink(users[0].id,users[0].email, users[0].nombre);

         
               },
               
              
              ),


          ],
        ),
      ),
    );
  }

  void openLink( String para1, String para2, String para3) {
    String url = Uri.encodeFull('http://localhost:51539/?para1=$idpersona&para2=$emailuser&para3=$nombre&para4=$appaterno&para5=$cargo&para6=$direccion');


    html.window.open(url, '_blank');
  }
}
