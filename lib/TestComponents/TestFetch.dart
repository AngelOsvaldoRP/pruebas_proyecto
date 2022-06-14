// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../FrontPage/FrontPage.dart';
//
// Future<List<Post>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('http://192.168.100.26:7196/api/Usuario'));
//
//
//   var json = jsonDecode(response.body) as List;
//
//   if (response.statusCode == 200) {
//     // Si la llamada al servidor fue exitosa, analiza el JSON
//     print(response.body);
//     return List.from(json).map((e) => Post.fromJson(e)).toList();
//   } else {
//     print("2");
//     // Si la llamada no fue exitosa, lanza un error.
//     throw Exception('Failed to load post');
//   }
// }
//
// Future<Post> create(String name) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.100.26:7196/api/Usuario'),
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
//   print(response.statusCode);
//
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Post.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }
//
//
// class Post {
//   final int id;
//   final String userName;
//   final String name;
//   final String password;
//   final String type;
//
//
//   Post({required this.id, required this.userName, required this.name, required this.password, required this.type});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       userName: json['userName'],
//       name: json['name'],
//       password: json['password'],
//       type: json['type']
//     );
//   }
// }
//
// // void main() => runApp(TestFetch(post: fetchPost()));
// //
// // class TestFetch extends StatelessWidget {
// //   final Future<List<Post>> post;
// //
// //   const TestFetch({Key? key, required this.post}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Fetch Data Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Fetch Data Example'),
// //         ),
// //         body: Center(
// //           child: FutureBuilder<List<Post>>(
// //             future: post,
// //             builder: (context, snapshot) {
// //               if (snapshot.hasData) {
// //                 print(snapshot.data![0].name);
// //                 print("Funciona");
// //                 //return Text(snapshot.data[0].userName ?? "");
// //               } else if (snapshot.hasError) {
// //                 print("${snapshot.error}");
// //                 print("error");
// //                 return Text("${snapshot.error}");
// //               }
// //
// //               // Por defecto, muestra un loading spinner
// //               return null;
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }