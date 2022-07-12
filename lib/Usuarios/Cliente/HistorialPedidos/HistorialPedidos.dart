
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../FetchData/FetchOrden.dart';
import '../../../FetchData/FetchProducto.dart';
import '../../../FetchData/FetchTienda.dart';
import '../InterfazCliente.dart';

class HistorialPedido extends StatelessWidget {
  
  final int idCliente;
  final List orden;

  HistorialPedido({Key? key, required this.idCliente, required this.orden}) : super(key: key);

  get itemCount => null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  (Colors.red[900])!,
                  (Colors.red[500])!,
                  (Colors.red[400])!
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            // #login, #welcome
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                  Text("Pedidos",style: TextStyle(color: Colors.white,fontSize: 40),),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage('assets/pedido.png'),
                            height: 150,
                            alignment: Alignment.topCenter
                        ),
                        // #email, #password
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const[
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),blurRadius: 20,offset: Offset(0,10)),
                            ],
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: orden.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("Orden ID: ${(orden[index])[0]} Estado: ${(orden[index])[3]}"),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPedido(orden: orden[index], idCliente: idCliente)));
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),

                        // #signup_button
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => InterfazCliente(tienda: fetchTienda(), producto: fetchProducto(), idCliente: idCliente, orden: fetchOrden())));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Volver Pagina Inicio",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPedido extends StatefulWidget {

  final List orden;
  final int idCliente;

  const InfoPedido({Key? key, required this.orden, required this.idCliente}) : super(key: key);

  @override
  _InfoPedidoState createState() => _InfoPedidoState();
}

class _InfoPedidoState extends State<InfoPedido> {


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
                  child: ListView(
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
                                  hintText: "Orden ID: ${(widget.orden)[0]}",
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
                                  hintText: "Tienda: ${(widget.orden)[1]}",
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
                                  hintText: "Ubicación: ${(widget.orden)[4]}",
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
                                  hintText: "Pago Total: ${(widget.orden)[2]}",
                                  hintStyle: const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      QrImage(
                          data: (widget.orden)[5],
                          version: QrVersions.auto,
                          size: 200,
                          padding: const EdgeInsets.only(left: 110,top: 10, right: 10, bottom: 10),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // #signup_button
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialPedido(idCliente: widget.idCliente, orden: widget.orden)));
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: Colors.red[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text("Cambiar Pedido",style: TextStyle(
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
