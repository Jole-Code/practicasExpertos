import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaApi(),
    );
  }
}

class PantallaApi extends StatefulWidget {
  @override
  State<PantallaApi> createState() => _PantallaApiState();
}

class _PantallaApiState extends State<PantallaApi> {
  List datos = [];
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  void cargarDatos() async {
    final res = await http.get(Uri.parse("https://dummyjson.com/users"));
    setState(() => datos = json.decode(res.body)["users"]);
  }

  Future<void> agregarDato() async {
    if (nombreCtrl.text.isEmpty || emailCtrl.text.isEmpty) return;

    final res = await http.post(
      Uri.parse("https://dummyjson.com/users/add"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "firstName": nombreCtrl.text,
        "email": emailCtrl.text
      }),
    );

    final nuevoUsuario = json.decode(res.body);

    setState(() {
      datos.add(nuevoUsuario);
    });

    nombreCtrl.clear();
    emailCtrl.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Usuario agregado correctamente")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuarios"),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: nombreCtrl,
                  decoration: InputDecoration(labelText: "Nombre"),
                ),
                TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child:
                      ElevatedButton(onPressed: cargarDatos, child: Text("Cargar"))
                    ),

                    SizedBox(width: 8),

                    Expanded(child:
                      ElevatedButton(onPressed: agregarDato, child: Text("Agregar"))
                    ),
                  ],
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, i) => ListTile(
                leading: CircleAvatar(child: Text(datos[i]["firstName"][0])),
                title: Text(datos[i]["firstName"]),
                subtitle: Text(datos[i]["email"]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}