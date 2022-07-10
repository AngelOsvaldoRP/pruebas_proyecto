
import 'package:flutter/material.dart';

import '../../../FetchData/FetchProducto.dart';
import '../../../FetchData/FetchTienda.dart';
import '../../Cliente/InterfazCliente.dart';
import 'PrepararPedido.dart';

class VerPedidos extends StatelessWidget {

  const VerPedidos({Key? key}) : super(key: key);

  get itemCount => null;

  @override
  Widget build(BuildContext context) {

    final cafeterias = ['Pedido1', 'Pedido2', 'Pedido3'];

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
                          itemCount: cafeterias.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(cafeterias[index]),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrepararPedido()));
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

