import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Center(
            child: Text("Bienvenido a RobEat", style: TextStyle(color: Colors.white, fontSize: 35),),
          ),
          // SizedBox(height: 10,),
          // Center(
          //   child: Text("Inicio de Sesión", style: TextStyle(color: Colors.white, fontSize: 18),),
          // )
        ],
      ),
    );
  }
}