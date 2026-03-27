import 'package:flutter/material.dart';

void main() => runApp(Carts());

class Carts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaProducto(),
    );
  }
}

const productos = [
  {"nombre": "Producto 1", "precio": 99.99, "imagen": "../assets/imagen1.jpg"},
  {"nombre": "Producto 2", "precio": 149.99, "imagen": "../assets/imagen2.jpg"},
  {"nombre": "Producto 3", "precio": 199.99, "imagen": "../assets/imagen3.jpg"},
];

class PaginaProducto extends StatefulWidget {
  @override
  _PaginaProductoState createState() => _PaginaProductoState();
}

class _PaginaProductoState extends State<PaginaProducto> {
  int carritoContador = 0;

  void agregarAlCarrito() {
    setState(() {
      carritoContador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards en Flutter'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text("$carritoContador", style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),

      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        padding: EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,

        children: [
          // 1. Básico
          Card(child: Center(child: Text("Básico"))),

          // 2. Con icono
          Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 30),
                Text("Icono", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          // 3. Imagen
          Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('../assets/imagen3.jpg', fit: BoxFit.cover),
                ),
                Text("Imagen", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          // 4. Botón
          Card(
            color: Colors.blue.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Botón", style: TextStyle(fontSize: 12)),
                ElevatedButton(
                  onPressed: agregarAlCarrito,
                  child: Icon(Icons.add, size: 16),
                ),
              ],
            ),
          ),

          // 5. Producto
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag, size: 30),
                Text("\$99", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          // 6. ListTile
          Card(
            child: ListTile(
              title: Text(
                productos[0]["nombre"] as String,
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "\$${productos[0]["precio"]}",
                style: TextStyle(fontSize: 14),
              ),
              leading: Image.asset(
                productos[0]["imagen"] as String,
                fit: BoxFit.cover,
              ),
              trailing: Icon(Icons.arrow_forward, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}