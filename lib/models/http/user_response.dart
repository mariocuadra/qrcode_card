// To parse this JSON data, do
//
//     final userResponse = userResponseFromMap(jsonString);


import 'dart:convert';

List<UserResponse> userResponseFromJson(String str) => List<UserResponse>.from(json.decode(str).map((x) => UserResponse.fromJson(x)));

// To parse this JSON data, do

class UserResponse {
    UserResponse({
        required this.idcredencialpersona,
        required this.nombrePrimero,
        required this.nombreSegundo,
        required this.appaterno,
        required this.apmaterno,
        required this.cargo,
        required this.direccion,
        required this.telefono,
        required this.email,
        required this.ubicacion,
        required this.sitio_web,
        required this.imagenFoto,
    });

    int idcredencialpersona;
    String nombrePrimero;
    String nombreSegundo;
    String appaterno;
    String apmaterno;
    String cargo;
    String direccion;
    String telefono;
    String email;
    String ubicacion;
    String sitio_web;
    String imagenFoto;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        idcredencialpersona: json["idcredencialpersona"],
        nombrePrimero: json["nombre_primero"],
        nombreSegundo: json["nombre_segundo"],
        appaterno: json["appaterno"],
        apmaterno: json["apmaterno"],
        cargo: json["cargo"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        email: json["email"],
        ubicacion: json["ubicacion"],
        sitio_web: json["sitio_web"],
        imagenFoto: json["imagen_foto"],
    );

    Map<String, dynamic> toJson() => {
        "idcredencialpersona": idcredencialpersona,
        "nombre_primero": nombrePrimero,
        "nombre_segundo": nombreSegundo,
        "appaterno": appaterno,
        "apmaterno": apmaterno,
        "cargo": cargo,
        "direccion": direccion,
        "telefono": telefono,
        "email": email,
        "ubicacion": ubicacion,
        "sitio_web": sitio_web,
        "imagen_foto": imagenFoto,
    };
}
