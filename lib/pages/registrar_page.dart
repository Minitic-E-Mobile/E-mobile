import 'package:emobile/pages/login_page.dart';
import 'package:flutter/material.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({Key? key}) : super(key: key);

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
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
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Correo Electronico",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
