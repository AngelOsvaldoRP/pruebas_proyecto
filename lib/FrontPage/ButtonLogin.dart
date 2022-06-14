
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:pruebas_proyecto/FetchData/FetchUser.dart';

class ButtonLogin1 extends StatelessWidget{
  const ButtonLogin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(usuario: fetchUsuario())));
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.red[800],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text("Inicar Sesión",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
        )
    );
  }
}