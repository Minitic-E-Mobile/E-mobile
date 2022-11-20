import 'package:emobile/pages/registrar_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Detalle Sitio Turistico POI"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    'Nombre POI',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontSize: 26, fontWeight: FontWeight.bold),
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Ciudad: Bogota                                                                    ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  const Text('Departamento: Cundinamarca                                              '),
                  const Text('Temperatura: 20°                                                             '),
                  const Text('Descripcion: Esta informacion General del un punto Turistico con informacion relevante del mismo'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Otra Informacion de Interes.                                             '),
                  const SizedBox(
                    height: 20,
                  ),

                ],
              ),


          ),
        ),
      );

  }
}
