
import 'package:flutter/material.dart';

import '../../../TestComponents/Test.dart';
import 'FinalPedido.dart';
import 'crearOrden.dart';

class SelectUbication extends StatefulWidget {
  final List selectProducto;
  final int idTienda;
  final int idCliente;

  SelectUbication({Key? key, required this.selectProducto, required this.idTienda, required this.idCliente}) : super(key: key);

  @override
  _SelectUbication createState() => _SelectUbication();
}

class _SelectUbication extends State<SelectUbication> {

  final credito = TextEditingController();
  String cred = "";
  String dropdownValue = "A1";


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
                  Text("Ubicación",style: TextStyle(color: Colors.white,fontSize: 40),),
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
                            image: AssetImage('assets/ubication.png'),
                            height: 150,
                            alignment: Alignment.topCenter
                        ),
                        const SizedBox(height: 60,),
                        SizedBox(
                            height: 50.0,
                            width: 275.0,
                            child: DropdownButton(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: const TextStyle(color: Colors.redAccent, fontSize: 20.0, fontWeight: FontWeight.bold),
                              underline: Container(
                                height: 2,
                                color: Colors.redAccent,
                              ),
                              items: <String>["A1", "A2", "A3", "A4"]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                  onTap: (){
                                    print(value);
                                  },
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  print(newValue);
                                  dropdownValue = newValue!;
                                });
                              },
                            )
                        ),
                        const SizedBox(height: 60,),
                        // #vendedor
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FinalPedido(ordenInfo: generarOrden(widget.idTienda, widget.idCliente, widget.selectProducto, 1))));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Insertar Ubicación",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        //const ButtonLogin2(),
                        const SizedBox(height: 75),
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

