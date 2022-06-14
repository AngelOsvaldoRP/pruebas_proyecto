import 'package:flutter/material.dart';

TextEditingController userName = TextEditingController();
TextEditingController password = TextEditingController();

class InputField extends StatelessWidget{

  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: (Colors.grey[200])!)
            )
          ),
          child: TextField(
            controller: userName,
            onChanged: (userName){
              print(userName);
            },
            decoration: const InputDecoration(
              hintText: "Nombre de Usuario",
              hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: (Colors.grey[200])!)
              )
          ),
          child: TextField(
            controller: password,
            decoration: const InputDecoration(
                hintText: "Contraseña",
                hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}