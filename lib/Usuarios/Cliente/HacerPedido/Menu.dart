
import 'package:flutter/material.dart';

import 'Ubicacion.dart';


class Menu extends StatelessWidget {

  final String tienda;
  final List producto;
  final List selectProducto;
  final int idCliente;

  Menu({Key? key, required this.tienda, required this.producto, required this.selectProducto, required this.idCliente}) : super(key: key);

  get itemCount => null;


  @override
  Widget build(BuildContext context) {
    print(producto);

    final productos = ['Empanada1', 'Empanada2', 'Empanada3'];

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
                children: [
                  Text(tienda,style: const TextStyle(color: Colors.white,fontSize: 40),),
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
                            image: AssetImage('assets/menu.png'),
                            height: 100,
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
                          itemCount: producto.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("${(producto[index])[0]}  RD${(producto[index])[1]}"),
                              onTap: (){
                                if(selectProducto.contains(producto[index])){
                                  selectProducto.remove(producto[index]);
                                  (producto[index])[5] = (producto[index])[5] + 1;
                                  selectProducto.add(producto[index]);
                                }else{
                                  (producto[index])[5] = (producto[index])[5] + 1;
                                  selectProducto.add(producto[index]);
                                }

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(tienda: tienda,producto: producto,selectProducto: selectProducto, idCliente: idCliente,)));
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                        const Image(
                            image: AssetImage('assets/menuSelection.png'),
                            height: 75,
                            alignment: Alignment.topCenter
                        ),
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
                          itemCount: selectProducto.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("${(selectProducto[index])[0]}  RD${(selectProducto[index])[1]} Cant: ${(selectProducto[index])[5]}"),
                              onTap: (){
                                for(var x in producto){
                                  if(x[4] == (selectProducto[index])[4]){
                                    x[5] = x[5]-1;
                                    selectProducto.remove(selectProducto[index]);
                                    break;
                                  }
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(tienda: tienda,producto: producto,selectProducto: selectProducto, idCliente: idCliente,)));
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                        InkWell(
                            onTap: (){
                              if(selectProducto.isNotEmpty){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectUbication(selectProducto: selectProducto, idTienda: (producto[0])[3], idCliente: idCliente)));
                              }
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Confirmar Pedido",style: TextStyle(
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
