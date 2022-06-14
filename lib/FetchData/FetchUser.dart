import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constans.dart';


//Usuario

Future<List<Usuario>> fetchUsuario() async {
  final response =
  await http.get(Uri.parse("$url/Usuario"));


  var json = jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    print(response.body);
    return List.from(json).map((e) => Usuario.fromJson(e)).toList();
  } else {
    print("2");
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<Usuario> createUsuario(String name, String username, String password, String type) async {
  final response = await http.post(
    Uri.parse("$url/Usuario"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'UserName': username,
      'Name': name,
      'Password': password,
      'Type': type,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Usuario.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Usuario {
  final int id;
  final String userName;
  final String name;
  final String password;
  final String type;


  Usuario({required this.id, required this.userName, required this.name, required this.password, required this.type});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      userName: json['userName'],
      name: json['name'],
      password: json['password'],
      type: json['type']
    );
  }
}



//Usuario - Cliente

Future<Cliente> createCliente(int id, String credito) async {
  final response = await http.post(
    Uri.parse("$url/Cliente"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'IdUser': id,
      'Credito': credito,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Cliente.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Cliente {
  final int idUser;
  final String credito;


  Cliente({required this.idUser, required this.credito});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      idUser: json['idUser'],
      credito: json['credito'],
    );
  }
}

//Usuario - Vendedor

Future<Vendedor> createVendedor(int id, int idTienda) async {
  print(id);
  print(idTienda);
  final response = await http.post(
    Uri.parse("$url/Vendedor"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'IdUser': id,
      'IdTienda': idTienda,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Vendedor.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Vendedor {
  final int idUser;
  final int idTienda;


  Vendedor({required this.idUser, required this.idTienda});

  factory Vendedor.fromJson(Map<String, dynamic> json) {
    return Vendedor(
      idUser: json['idUser'],
      idTienda: json['idTienda'],
    );
  }
}

//Ubicacion

//Tienda

//Productos

//Ordenes

//Productos - Ordenes

