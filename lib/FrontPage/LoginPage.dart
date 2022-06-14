
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/Usuarios/Cliente/InterfazCliente.dart';
import 'package:pruebas_proyecto/FetchData/FetchUser.dart';
import '../FetchData/FetchUser.dart';

class LoginPage extends StatelessWidget {

  final Future<List<Usuario>> usuario;

  const LoginPage({Key? key, required this.usuario}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final userName = TextEditingController();
    final password = TextEditingController();
    List users = [];


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
                  Text("Iniciar Sesión",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Bienvenido",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                        const SizedBox(height: 60,),
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


                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  controller: userName,
                                  decoration: const InputDecoration(
                                    hintText: "Nombre de Usuario",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                ),
                                child: TextField(
                                  controller: password,
                                  decoration: const InputDecoration(
                                      hintText: "Contraseña",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        // #Forgot Password
                        //const Text("¿Olvidaste la Contraseña?",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30),
                        // #login

                        FutureBuilder<List<Usuario>>(
                          future: usuario,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && users.isEmpty) {
                              for(var x in snapshot.data!){
                                List newUser = [x.userName, x.password, x.type];
                                users.add(newUser);
                              }
                            } else if (snapshot.hasError) {
                              print("${snapshot.error}");
                              print("error");
                              return Text("${snapshot.error}");
                            }
                            // Por defecto, muestra un loading spinner
                            return const Text("");
                          },),
                        InkWell(
                            onTap: (){
                              var ver = false;
                              for(var x in users){
                                if(x[0] == userName.text){
                                  if(x[1] == password.text){
                                    ver = true;
                                    if(x[2] == "Cliente"){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InterfazCliente()));
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const InterfazCliente()));
                                    }
                                  }
                                }
                              }
                              print(ver);
                              if(ver == false){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Nombre de Usuario/Contraseña Incorrectas. Pruebe Conectandose a una red oficial"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                ver = false;
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
                                child: Text("Inicar Sesión",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),

                        //const ButtonLogin2(),
                        const SizedBox(height: 50),
                        const Image(
                            image: AssetImage('assets/logo1.png'),
                            height: 150,
                            alignment: Alignment.topCenter
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