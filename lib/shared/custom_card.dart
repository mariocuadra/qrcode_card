import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    //  required this.logo,
    required this.nombre,
    required this.appaterno,
    required this.cargo,
    required this.direccion,
    required this.telefono,
    required this.email,
    required this.sitioweb,
  });
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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlueAccent,
                  width: 1.0,
                ),
              ),
              child: const Image(
                  image: AssetImage('assets/images/logo.png')),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          Text(
            '$nombre $appaterno',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: Colors.black87,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            cargo,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            direccion,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            telefono,
            style: const TextStyle(fontSize: 15.0),
          ),
          Text(
            email,
            style: const TextStyle(fontSize: 15.0),
          ),
          Text(
            sitioweb,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        ],
      ),
    );
  }
}
