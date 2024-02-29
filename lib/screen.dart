import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON ListView Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4, // Añade sombra a la tarjeta
            margin: EdgeInsets.all(8), // Márgenes alrededor de la tarjeta
            color: Color.fromARGB(255, 19, 44, 61), // Color de fondo suave azul

            // Contenido de la tarjeta
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 18, 24, 34), // Color de texto azul oscuro
                ),
              ),
              subtitle: Text(
                'ID: ${items[index].id}',
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 129, 13), // Color de texto azul medio
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
