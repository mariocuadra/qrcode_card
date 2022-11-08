
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQR extends StatefulWidget {

  CustomQR({super.key, required this.datacode});
  
  String datacode;
  
  @override
  State<CustomQR> createState() => _CustomQRState();
  
}

class _CustomQRState extends State<CustomQR> {
  @override
  Widget build(BuildContext context) {
    return QrImage(
        data: widget.datacode,
        version: QrVersions.auto,
        size: 200.0,
        gapless: true,
        
      );
  }
}