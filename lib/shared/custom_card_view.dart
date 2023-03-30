

import 'package:flutter/material.dart';
import 'package:qrcode_card/shared/custom_card.dart';

class CustomCardView extends StatelessWidget {
   const CustomCardView({
    Key? key,
    // required this.logo,
    required this.nombre,
    required this.appaterno,
    required this.cargo,
    required this.direccion,
    required this.telefono,
    required this.email,
    required this.sitioweb,
  }) : super(key: key);
 // final String logo;
  final String nombre;
  final String appaterno;
  final String cargo;
  final String direccion;
  final String telefono;
  final String email;
  final String sitioweb;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 390,
                  height: 300,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  CustomCard(
                  
                      nombre: nombre,
                      appaterno: appaterno,
                      cargo: cargo,
                      direccion: direccion,
                      telefono: telefono,
                      email: email,
                      sitioweb: sitioweb,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  
}