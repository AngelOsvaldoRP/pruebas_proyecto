// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// String URLUsuario = 'http://192.168.100.15:7196/api/Usuario';
//
//
// //Usuario
//
// Future<List<Usuario>> fetchUsuario() async {
//   final response =
//   await http.get(Uri.parse(URLUsuario));
//
//
//   var json = jsonDecode(response.body) as List;
//
//   if (response.statusCode == 200) {
//     // Si la llamada al servidor fue exitosa, analiza el JSON
//     print(response.body);
//     return List.from(json).map((e) => Usuario.fromJson(e)).toList();
//   } else {
//     print("2");
//     // Si la llamada no fue exitosa, lanza un error.
//     throw Exception('Failed to load post');
//   }
// }
//
// Future<Usuario> create(String name) async {
//   final response = await http.post(
//     Uri.parse(URLUsuario),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, dynamic>{
//       'Id': 4,
//       'UserName': "Angel1",
//       'Name': name,
//       'Password': "12345",
//       'Type': "Cliente",
//     }),
//   );
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Usuario.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }
//
// class Usuario {
//   final int id;
//   final String userName;
//   final String name;
//   final String password;
//   final String type;
//
//
//   Usuario({required this.id, required this.userName, required this.name, required this.password, required this.type});
//
//   factory Usuario.fromJson(Map<String, dynamic> json) {
//     return Usuario(
//       id: json['id'],
//       userName: json['userName'],
//       name: json['name'],
//       password: json['password'],
//       type: json['type']
//     );
//   }
// }
//
// //Usuario - Cliente
//
// //Usuario - Vendedor
//
// //Ubicacion
//
// //Tienda
//
// //Productos
//
// //Ordenes
//
// //Productos - Ordenes
//
