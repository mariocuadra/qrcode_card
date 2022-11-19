// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);


import 'dart:convert';

class UserResponse {
    UserResponse({
        required this.idcard,
        required this.nombre,
        required this.appaterno,
        required this.cargo,
        required this.direccion,
        required this.telefono,
        required this.email,
    });

    String idcard;
    String nombre;
    String appaterno;
    String cargo;
    String direccion;
    String telefono;
    String email;

    factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        idcard: json["idcard"],
        nombre: json["nombre"],
        appaterno: json["appaterno"],
        cargo: json["cargo"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "idcard": idcard,
        "nombre": nombre,
        "appaterno": appaterno,
        "cargo": cargo,
        "direccion": direccion,
        "telefono": telefono,
        "email": email,
    };
}
