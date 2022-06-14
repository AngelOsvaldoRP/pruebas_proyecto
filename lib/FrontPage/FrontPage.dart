
import 'package:flutter/material.dart';
import '../Header.dart';
import 'ButtonLogin.dart';
import 'ButtonRegister.dart';



class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            (Colors.red[900])!,
            (Colors.red[500])!,
            (Colors.red[400])!
          ]),
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20,),
            const Header(),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40,),
                    const ButtonLogin1(),
                    const SizedBox(height: 40,),
                    ButtonRegister(1),
                    const SizedBox(height: 80,),
                    const Image(
                          image: AssetImage('assets/logo1.png'),
                          height: 500,
                          alignment: Alignment.topCenter
                        ),
                  ],
                ),
              )
            ),),
          ],
        ),
      ),
    );
  }
}