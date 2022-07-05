
import 'package:flutter/material.dart';
import 'package:pruebas_proyecto/Usuarios/Cliente/InterfazCliente.dart';
import 'package:pruebas_proyecto/Usuarios/Vendedor/InterfazVendedor.dart';
import '../FetchData/FetchProducto.dart';
import '../FetchData/FetchTienda.dart';
import '../FetchData/FetchUser.dart';



class RegisterOption extends StatelessWidget {

  final String name;
  final String userName;
  final String password;
  late Future<Usuario> _post;
  final Future<List<Tienda>> tiendas;
  late bool ver = false;



  RegisterOption({Key? key, required this.name, required this.userName, required this.password, required this.tiendas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cafet = [];

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
                  Text("¿Quién eres?",style: TextStyle(color: Colors.white,fontSize: 40),),
                  SizedBox(height: 10,),
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
                        // #cliente
                        InkWell(
                            onTap: (){
                              _post = createUsuario(name,userName,password,"Cliente");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CostumerOption(userName: userName, usuario: fetchUsuario(),)));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Cliente",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        const SizedBox(height: 60,),
                        // #vendedor
                      FutureBuilder<List<Tienda>>(
                        future: tiendas,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && ver == false) {
                            for(var x in snapshot.data!){
                              cafet.add(x.name);
                              print(cafet.length);
                              ver = true;
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
                              ver = false;
                              _post = createUsuario(name,userName,password,"Vendedor");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SalerOption1(caft: cafet,userName: userName, usuario: fetchUsuario(), tiendas: fetchTienda(),)));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Vendedor",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        //const ButtonLogin2(),
                        const SizedBox(height: 75),
                        const Image(
                            image: AssetImage('assets/logo1.png'),
                            height: 500,
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


class CostumerOption extends StatelessWidget {

  final String userName;
  final Future<List<Usuario>> usuario;
  late Future<Cliente> _postCliente;

  CostumerOption({Key? key, required this.userName, required this.usuario}) : super(key: key);

  final credito = TextEditingController();

  late int id = 0;


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
                  Text("Cliente",style: TextStyle(color: Colors.white,fontSize: 40),),
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
                        // #credito
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    spreadRadius: 10,
                                    offset: const Offset(0, 10))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: credito,
                                decoration: const InputDecoration(
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "Credito Disponible",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60,),
                        // #vendedor
                        FutureBuilder<List<Usuario>>(
                          future: usuario,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              for(var x in snapshot.data!){
                                if(x.userName == userName){
                                  id = x.id;
                                }
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
                              _postCliente = createCliente(id, credito.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => InterfazCliente(tienda: fetchTienda(), producto: fetchProducto())));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Finalizar Registro",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        //const ButtonLogin2(),
                        const SizedBox(height: 75),
                        const Image(
                            image: AssetImage('assets/logo1.png'),
                            height: 500,
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

class SalerOption1 extends StatelessWidget {

  final Future<List<Usuario>> usuario;
  final Future<List<Tienda>> tiendas;
  final String userName;
  final caft;

  SalerOption1({Key? key, required this.usuario, required this.userName, required this.tiendas, this.caft}) : super(key: key);

  get itemCount => null;


  @override
  Widget build(BuildContext context) {
    final cafeterias = ['Kiosko', 'Pensum', 'Colegio'];



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

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: caft.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(caft[index]),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SalerOption2(usuario: usuario, userName: userName, tienda: caft[index],tiendas: tiendas)));
                              },
                            );
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

class SalerOption2 extends StatelessWidget {

  final Future<List<Usuario>> usuario;
  final Future<List<Tienda>> tiendas;
  final String userName;
  final String tienda;

  SalerOption2({Key? key, required this.usuario, required this.userName, required this.tiendas, required this.tienda}) : super(key: key);

  late Future<Vendedor> _postVendedor;
  late int id = 0;
  late int idTienda = 0;

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
                  Text("Vendedor",style: TextStyle(color: Colors.white,fontSize: 40),),
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
                        // #credito
                        const SizedBox(height: 60,),
                        // #vendedor
                        FutureBuilder<List<Usuario>>(
                          future: usuario,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              for(var x in snapshot.data!){
                                if(x.userName == userName){
                                  id = x.id;
                                }
                              }
                            } else if (snapshot.hasError) {
                              print("${snapshot.error}");
                              print("error");
                              return Text("${snapshot.error}");
                            }
                            // Por defecto, muestra un loading spinner
                            return const Text("");
                          },),
                      FutureBuilder<List<Tienda>>(
                        future: tiendas,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            for(var x in snapshot.data!){
                              if(x.name == tienda){
                                idTienda = x.id;
                              }
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
                              _postVendedor = createVendedor(id, idTienda);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const InterfazVendedor()));
                            },
                            child: Container(
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.red[800],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text("Finalizar Registro",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            )
                        ),
                        //const ButtonLogin2(),
                        const SizedBox(height: 75),
                        const Image(
                            image: AssetImage('assets/logo1.png'),
                            height: 500,
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


