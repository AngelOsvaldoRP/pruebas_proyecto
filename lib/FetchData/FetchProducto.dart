import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'constans.dart';

Future<List<Producto>> fetchProducto() async {
  final response =
  await http.get(Uri.parse("$url/Producto"));


  var json = jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    //print(response.body);
    return List.from(json).map((e) => Producto.fromJson(e)).toList();
  } else {
    print("2");
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}


// Future<Tienda> createProducto(String name, String username, String password, String type) async {
//   final response = await http.post(
//     Uri.parse("$url/Tienda"),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       'UserName': username,
//       'Name': name,
//       'Password': password,
//       'Type': type,
//     }),
//   );
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Tienda.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

class Producto {
  final int id;
  final int idTienda;
  final String name;
  final int cant;
  final int price;


  Producto({required this.id, required this.idTienda, required this.name, required this.cant, required this.price});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      idTienda: json['idTienda'],
      name: json['name'],
      cant: json['cant'],
      price: json['price'],
    );
  }
}