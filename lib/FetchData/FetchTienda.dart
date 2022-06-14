import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constans.dart';


Future<List<Tienda>> fetchTienda() async {
  final response =
  await http.get(Uri.parse("$url/Tienda"));


  var json = jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    print(response.body);
    return List.from(json).map((e) => Tienda.fromJson(e)).toList();
  } else {
    print("2");
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<Tienda> createTienda(String name, String username, String password, String type) async {
  final response = await http.post(
    Uri.parse("$url/Tienda"),
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
    return Tienda.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Tienda {
  final int id;
  final String name;
  final int idUbication;


  Tienda({required this.id, required this.name, required this.idUbication});

  factory Tienda.fromJson(Map<String, dynamic> json) {
    return Tienda(
        id: json['id'],
        name: json['name'],
        idUbication: json['idUbication'],
    );
  }
}
