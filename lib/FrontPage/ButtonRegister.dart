import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/FrontPage/RegisterPage.dart';

import '../TestComponents/Test.dart';

class ButtonRegister extends StatelessWidget{
  int d;
  ButtonRegister(this.d, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: (){
          if (d==1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
          }
          if(d==2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()));
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
            child: Text("Registrarse",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
        )
    );
  }
}

