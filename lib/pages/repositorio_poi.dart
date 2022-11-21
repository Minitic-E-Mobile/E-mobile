import 'package:emobile/pages/home_page.dart';
import 'package:emobile/pages/repositorio_poi.dart';
import 'package:flutter/material.dart';

class RepositorioPoi extends StatefulWidget {
  const RepositorioPoi({Key? key}) : super(key: key);

  @override
  State<RepositorioPoi> createState() => _RepositorioPoiState();
}

class _RepositorioPoiState extends State<RepositorioPoi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            appBar: AppBar(
                title: Text('Sitios Turisticos')
            ),
            body: new ListView(
                children: [
                  _buildItem('Primer POI!'),
                  _buildItem('Segundo POI!'),
                  _buildItem('Tercer POI!'),
                  _buildItem('Cuarto POI!'),
                  _buildItem('Quinto POI!'),
                  _buildItem('Sexto POI!'),
                  _buildItem('Octavo POI!'),
                  _buildItem('Noveno POI!'),
                  _buildItem('decimo POI!'),
                  _buildItem('Onceavo POI!'),
                  _buildItem('Doceavo POI!'),
                  _buildItem('Treceavo POI!'),
                  _buildItem('Catorceavo POI!'),
                  _buildItem('Quinseavo POI!'),
                  _buildItem('Diesiceisavo POI!'),
                  _buildItem('Diesisiete POI!'),
                  _buildItem('Diesiocho POI!')

                ]
            )
        )
    );
  }


Widget _buildItem(String textTitle) {
  return new ListTile(
    title: new Text(textTitle),
    subtitle: new Text('Descripcion: Esta informacion General del un punto Turistico con informacion relevante del mismo'),
    leading: new Icon(Icons.map),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    );
  }
}
