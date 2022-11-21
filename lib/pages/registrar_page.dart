import 'package:emobile/pages/login_page.dart';
import 'package:emobile/repositorio/usuario_registrar.dart';
import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {

  final email=TextEditingController();
  final password=TextEditingController();
  final passwordConf=TextEditingController();

  Usuario_Registrar usuario=Usuario_Registrar();

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
  
  
  void guardarUsuario() async{
    if(password.text == passwordConf.text) {
      bool resultado = await usuario.registrarUsuario(
          email.text, password.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }else{
      mostrarMensaje("Las Contraseñas no coniciden");
    }
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
                height: 15,
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
                height: 15,
              ),
              TextFormField(
                controller: passwordConf,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Repetir Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.vpn_key)
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: (){
                    guardarUsuario();
                  },
                  child: const Text("Registrar")
              )
            ],
          ),
        ),
      ),
    );
  }
}
