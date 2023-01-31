import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'service/notification_service.dart';
import 'package:qrcode_card/models/http/user_response.dart';
import 'package:qrcode_card/service/local_storage.dart';
import 'package:qrcode_card/shared/custom_flat_button.dart';
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
}

class _MyAppState extends State<MyApp> {
  String data = '';
  String emailuser = '';
  String url = '';

  UserResponse user = UserResponse(
      idcredencialpersona: 0,
      nombrePrimero: 'nombrePrimero',
      nombreSegundo: 'nombreSegundo',
      appaterno: 'appaterno',
      apmaterno: 'apmaterno',
      cargo: 'cargo',
      direccion: 'direccion',
      telefono: 'telefono',
      email: 'email',
      ubicacion: 'ubicacion',
      sitio_web: 'sitio_web',
      imagenFoto: 'imagenFoto');
  var nameController = TextEditingController();
  late QrPainter _painter;
  GlobalKey globalKey = GlobalKey();

  int size = 2;

  @override
  Widget build(BuildContext context) {
    _painter = QrPainter(
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      eyeStyle: const QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Color.fromARGB(255, 58, 12, 206),
      ),
      data: json.encode(data),
      version: QrVersions.auto,
    );

    return MaterialApp(
      title: 'Credencial UBO',
      scaffoldMessengerKey: NotificationService.messengerKey,
      home: Scaffold(
  
        body: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CustomPaint(
                    size: Size.square((size * 100).toDouble()),
                    key: globalKey,
                    painter: _painter),
              ),
            ),
            _buildTextField(
              nameController,
              "Ingrese email corporativo...",
            ),
            CustomFlatButton(
              text: 'Validar',
              onPressed: () {
                setState(() {
                  emailuser = nameController.text;
                });

                final res = CardUboApi.fetchUser(emailuser);
                try {
                  res.then((json) {
                    //  setState(() {
                    //emailuser =json.email;
                    url = urlOneParam(json.email.toString());

                    NotificationService.showSnackbarError(
                        'Usuario identificado',
                        Colors.white.withOpacity(0.9),
                        Colors.green);

                    setState(() {
                      data = url;
                    });

                    /*  user.idcredencialpersona = json.idcredencialpersona;
                    user.nombrePrimero = json.nombrePrimero;
                    user.nombreSegundo = json.nombreSegundo;
                    user.appaterno = json.appaterno;
                    user.apmaterno = json.apmaterno;
                    user.cargo = json.cargo;
                    user.direccion = json.direccion;
                    user.telefono = json.telefono;
                    user.email = json.email;
                    user.ubicacion = json.ubicacion;
                    user.sitio_web = json.sitio_web;
                    user.imagenFoto = json.imagenFoto; */
                  });
                } catch (e) {
                  data = 'invalido';

                  print('error al consultar el usuario $e');
                }
              },
            ),
            CustomFlatButton(
                text: 'Vista',
                onPressed: () {
                  setState(() {
                    print(user.idcredencialpersona);
                    print(user.appaterno);
                    openLink(url);
                  });
                })
          ],
        ),
      ),
    );
  }

  void openLink(String url) {
    html.window.open(url, '_blank');
  }

  String urlOneParam(String para2) {
    String url = 'https://descarga.ubo.cl/qrcode-card-view/?para2=$para2';

    return url;
  }

  Widget _buildTextField(
      TextEditingController textController, String hintText) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: TextField(
            onChanged: (value) {
              setState(() {
                data = value;
              });
            },
            textAlign: TextAlign.center,
            controller: textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 18, color: Colors.black26)),
          ),
        ));
  }
}
