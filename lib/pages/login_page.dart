import 'package:emobile/pages/home_page.dart';
import 'package:emobile/pages/registrar_page.dart';
import 'package:emobile/pages/repositorio_poi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email=TextEditingController();
  final password=TextEditingController();
  FirebaseAuth auth= FirebaseAuth.instance;

  void validarUsuario() async{
    try {

        final user = await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
        if(user != null){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RepositorioPoi()));
        }

    } on FirebaseAuthException catch (e) {
      //mostrarMensaje("${e.code}");
      if(e.code=="invalid-email"){
        mostrarMensaje("Email invalido");
      }
      if(e.code=="user-not-found"){
        mostrarMensaje("El Usuario no existe");
      }
      if(e.code=="wrong-password"){
        mostrarMensaje("Contraseña Incorrecta");
      }
      if(e.code=="unknown"){
        mostrarMensaje("Complete los datos");
      }
      if(e.code=="network-request-failed"){
        mostrarMensaje("Revise la conexion a Internet.");
      }
    }
  }

  void mostrarMensaje(String mensaje){
    final pantalla=ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
        SnackBar(
          content: Text(mensaje, style: const TextStyle(fontSize: 16),),
          backgroundColor: Color(0xFFD50000),
          duration: const Duration(seconds: 10),

        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                  margin: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black38, width: 4),
                      color: Colors.black
                  ),
                  child: const Image(image: AssetImage("assets/Logo.png"), width: 140, height: 140),
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Correo Electronico",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.vpn_key)
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: (){
                      validarUsuario();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: Text("Iniciar sesión")
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue)
                    ),
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrarPage()));
                    },
                    child: const Text("Registrate")
                )
              ],
          ),
        ),
      ),
    );
  }
}
