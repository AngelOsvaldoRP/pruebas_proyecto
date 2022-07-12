
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/Usuarios/Cliente/HacerPedido/HacerPedido.dart';
import 'package:pruebas_proyecto/Usuarios/Cliente/PerfilCliente/PerfilCliente.dart';

import '../../FetchData/FetchOrden.dart';
import '../../FetchData/FetchProducto.dart';
import '../../FetchData/FetchTienda.dart';
import 'HistorialPedidos/HistorialPedidos.dart';

class InterfazCliente extends StatelessWidget {

  final Future<List<Tienda>> tienda;
  final Future<List<Producto>> producto;
  final Future<List<Orden>> orden;
  final int idCliente;


  InterfazCliente({Key? key, required this.tienda, required this.producto, required this.idCliente, required this.orden}) : super(key: key);



  get myMarkerThumb => null;




  @override
  Widget build(BuildContext context) {

    List tiendaName = [];
    List productos = [];
    List ordenes = [];


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
                  Text("RobEat",style: TextStyle(color: Colors.white,fontSize: 40),),
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


                          child: Column(
                            children: [
                              Container(
                              ),
                              Container(

                              ),

                            ],
                          ),
                        ),
                        FutureBuilder<List<Tienda>>(
                          future: tienda,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && tiendaName.isEmpty) {
                              for(var x in snapshot.data!){
                                tiendaName.add(x);
                              }
                            } else if (snapshot.hasError) {
                              print("${snapshot.error}");
                              print("error");
                              return Text("${snapshot.error}");
                            }
                            // Por defecto, muestra un loading spinner
                            return const Text("");
                          },),
                        FutureBuilder<List<Producto>>(
                          future: producto,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && productos.isEmpty) {
                              for(var x in snapshot.data!){
                                List newProducto = [x.name,x.price,x.cant,x.idTienda,x.id,0];
                                productos.add(newProducto);
                              }
                            } else if (snapshot.hasError) {
                              print("${snapshot.error}");
                              print("error");
                              return Text("${snapshot.error}");
                            }
                            // Por defecto, muestra un loading spinner
                            return const Text("");
                          },),
                        FutureBuilder<List<Orden>>(
                          future: orden,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && ordenes.isEmpty) {
                              for(var x in snapshot.data!){
                                if(x.idUser == idCliente){
                                  List newOrden = [x.id,x.idTienda,x.total,x.status,x.idUbication, x.qrCode];
                                  ordenes.add(newOrden);
                                }
                              }
                            } else if (snapshot.hasError) {
                              print("${snapshot.error}");
                              print("error");
                              return Text("${snapshot.error}");
                            }
                            // Por defecto, muestra un loading spinner
                            return const Text("");
                          },),

                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HacerPedido(tienda: tiendaName, productos: productos, idCliente: idCliente)));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Hacer Pedido",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        //const ButtonLogin2(),
                        const SizedBox(height: 50),


                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialPedido(idCliente: idCliente, orden: ordenes)));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Historial de Pedidos",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        const SizedBox(height: 50),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilCliente(idCliente: idCliente)));

                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Ver mi Perfil",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        const SizedBox(height: 25),
                        const Image(
                            image: AssetImage('assets/logo1.png'),
                            height: 300,
                            alignment: Alignment.topCenter
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