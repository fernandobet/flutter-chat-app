// To parse this JSON data, do
//
//     final usuarioDb = usuarioDbFromJson(jsonString);

import 'dart:convert';

UsuarioDb usuarioDbFromJson(String str) => UsuarioDb.fromJson(json.decode(str));

String usuarioDbToJson(UsuarioDb data) => json.encode(data.toJson());

class UsuarioDb {
    UsuarioDb({
        this.online,
        this.nombre,
        this.email,
        this.uid,
    });

    bool online;
    String nombre;
    String email;
    String uid;

    factory UsuarioDb.fromJson(Map<String, dynamic> json) => UsuarioDb(
        online: json["online"],
        nombre: json["nombre"],
        email: json["email"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "online": online,
        "nombre": nombre,
        "email": email,
        "uid": uid,
    };
}
