

class ModelUser {
  String id;
  String nombre;
  String appaterno;
  String cargo;
  String direccion;
  String telefono;
  String email;

  ModelUser({
    required this.id,
    required this.nombre,
    required this.appaterno,
    required this.cargo,
    required this.direccion,
    required this.telefono,
    required this.email,
  });

  factory ModelUser.fromJson(Map json) {
    return ModelUser(
      id: json['idcard'],
      nombre: json['nombre'],
      appaterno: json['appaterno'],
      cargo: json['cargo'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      email: json['email'],
    );
  }


}
