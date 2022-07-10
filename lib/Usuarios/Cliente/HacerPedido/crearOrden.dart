import 'dart:math';

import '../../../FetchData/FetchOrden.dart';

Future<Orden> generarOrden (idTienda, idCliente, selectProducto, idUbication) {
  late Future<Orden> _post;
  int? total = 0;
  for(var x in selectProducto){
    total = (total! + ((x[1])*(x[5]))) as int?;
  }
  _post = createOrden(idTienda, idCliente, total!, "Pendiente", idUbication, getRandomString(10));
  print("object");
  print(_post);
  return _post;
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));