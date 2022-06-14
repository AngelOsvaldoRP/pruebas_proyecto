import 'package:flutter/material.dart';

//import 'Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: const InputField(),
          ),
          const SizedBox(height: 40,),
          const Text(
            "¿Olvidaste la Contraseña?",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40,),
          //const Button(),
          Row(
            children: const [
              Expanded(
                child: Image(
                  image: AssetImage('assets/logo1.png'),
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}