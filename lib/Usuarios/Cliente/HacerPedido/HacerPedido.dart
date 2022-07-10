
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/FetchData/FetchTienda.dart';
import '../../../FetchData/FetchProducto.dart';
import 'Menu.dart';

List getTiendaProducto (tiendaId, productos) {
  List producto = [];
  for(var x in productos){
    print(x);
    if(tiendaId == x[3]){
      producto.add("${x[0]}  RD${x[1]}");
    }
  }
  return producto;

}

class HacerPedido extends StatelessWidget {
  final List tienda;
  final List productos;
  final int idCliente;

  const HacerPedido({Key? key, required this.tienda, required this.productos, required this.idCliente}) : super(key: key);

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
                        const Image(
                            image: AssetImage('assets/cafeteria.png'),
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
                          itemCount: tienda.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(tienda[index].name),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(tienda: tienda[index].name, producto: productos, selectProducto: [], idCliente: idCliente)));
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
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