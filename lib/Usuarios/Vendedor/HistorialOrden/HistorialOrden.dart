
import 'package:flutter/material.dart';

import '../../../FetchData/FetchProducto.dart';
import '../../../FetchData/FetchTienda.dart';
import '../../Cliente/InterfazCliente.dart';

class HistorialOrden extends StatelessWidget {

  const HistorialOrden({Key? key}) : super(key: key);

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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoPedido()));
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

class InfoPedido extends StatefulWidget {

  const InfoPedido({Key? key}) : super(key: key);

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
                          children: const [

                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Orden ID: ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Cliente: ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Ubicación: ",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                            Divider(
                              thickness: 0.5,
                              height: 10,
                            ),
                            TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintText: "Pago Total: ",
                                  hintStyle: TextStyle(color: Colors.grey)),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HistorialOrden()));
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

