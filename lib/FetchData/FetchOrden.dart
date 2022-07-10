import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constans.dart';


//Usuario

Future<List<Orden>> fetchOrden() async {
  final response =
  await http.get(Uri.parse("$url/Orden"));


  var json = jsonDecode(response.body) as List;

  if (response.statusCode == 200) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    print(response.body);
    return List.from(json).map((e) => Orden.fromJson(e)).toList();
  } else {
    print("2");
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<Orden> createOrden(int idTienda, int idUser, int total, String status, int idUbication, String qrCode) async {
  final response = await http.post(
    Uri.parse("$url/Orden"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'IdTienda': idTienda,
      'IdUser': idUser,
      'Total': total,
      'Status': status,
      'IdUbication': idUbication,
      'QRCode': qrCode,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Orden.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Orden {
  final int id;
  final int idTienda;
  final int idUser;
  final int total;
  final String status;
  final int idUbication;
  final String qrCode;

  Orden({required this.id, required this.idTienda, required this.idUser, required this.total, required this.status, required this.idUbication, required this.qrCode});

  factory Orden.fromJson(Map<String, dynamic> json) {
    return Orden(
        id: json['id'],
        idTienda: json['idTienda'],
        idUser: json['idUser'],
        total: json['total'],
        status: json['status'],
        idUbication: json['idUbication'],
        qrCode: json['qrCode']
    );
  }
}


