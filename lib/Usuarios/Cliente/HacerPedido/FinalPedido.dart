
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/Usuarios/Cliente/InterfazCliente.dart';

import '../../../FetchData/FetchOrden.dart';
import '../../../FetchData/FetchProducto.dart';
import '../../../FetchData/FetchTienda.dart';
import 'package:qr/qr.dart';

final qrCode = QrCode(4, QrErrorCorrectLevel.L)..addData('Hello, world in QR form!');
final qrImage = QrImage(qrCode);


class FinalPedido extends StatefulWidget {

  final Future<Orden> ordenInfo;

  const FinalPedido({Key? key, required this.ordenInfo}) : super(key: key);

  @override
  _FinalPedidoState createState() => _FinalPedidoState();

}

class _FinalPedidoState extends State<FinalPedido> {

  int? ordenID;
  int? tiendaID;
  int? ubicationID;
  int? total;


  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    (Colors.red[900])!,
                    (Colors.red[500])!,
                    (Colors.red[400])!
                  ])),
          child: Column(
            children: [
              const SizedBox(height: 80),
              // #login, #welcome
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const[
                    Text("Info Pedido",style: TextStyle(color: Colors.white,fontSize: 40),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Image(
                          image: AssetImage('assets/pedido.png'),
                          height: 125,
                          alignment: Alignment.topCenter
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder<Orden>(
                        future: widget.ordenInfo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            ordenID = snapshot.data?.id;
                            tiendaID = snapshot.data?.idTienda;
                            ubicationID = snapshot.data?.idUbication;
                            total = snapshot.data?.total;
                          } else if (snapshot.hasError) {
                            print("${snapshot.error}");
                            print("error");
                            return Text("${snapshot.error}");
                          }
                          // Por defecto, muestra un loading spinner
                          return const Text("");
                        },),

                      // #text_field
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: MediaQuery.of(context).size.height*0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 20,
                                  spreadRadius: 10,
                                  offset: const Offset(0, 10))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Orden ID: $ordenID",
                                  hintStyle: const TextStyle(color: Colors.grey)),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Tienda: $tiendaID",
                                  hintStyle: const TextStyle(color: Colors.grey)),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Ubicación: $ubicationID",
                                  hintStyle: const TextStyle(color: Colors.grey)),
                            ),
                            const Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Pago Total: $total",
                                  hintStyle: const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                      // #signup_button
                      InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => InterfazCliente(tienda: fetchTienda(), producto: fetchProducto())));
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.red[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text("Confirmar Envío",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

