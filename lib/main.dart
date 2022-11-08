import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_card/shared/custom_input.dart';
import 'package:qrcode_card/shared/custom_qrcode.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  final myController = TextEditingController();

  void _printLatestValue() {}
}

class _MyAppState extends State<MyApp> {
  late String data = '';
  TextEditingController nameController = TextEditingController();
  late QrPainter _painter;
  GlobalKey globalKey = GlobalKey();
  int size = 5;

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
              child: const Text('Boton'),
              onPressed: () {
               // print(nameController.text);
                setState(() {
                  data=nameController.text;
            
                });    
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
