
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.indigo),
    home: PantallaLogin(),
  ));
}

class PantallaLogin extends StatefulWidget {
  PantallaLogin({super.key});
  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final correoCtrl = TextEditingController();
  final contraCtrl = TextEditingController();
  bool Login = true;

  Future<void> submit() async {
    try {
      final conexion = FirebaseAuth.instance;
      if (Login) {
      await conexion.signInWithEmailAndPassword(
        email: correoCtrl.text,
        password: contraCtrl.text);
      }else{
        await conexion.createUserWithEmailAndPassword(
        email: correoCtrl.text,
        password: contraCtrl.text);
      }
      if (mounted) ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('¡Exito!')),);
    }catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.people, size: 80, color: Colors.indigo),
              Text(Login ? "Bienvenido" : "Registro", style: 
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextField(controller: correoCtrl, decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder()
              )),
              SizedBox(height: 15),
              TextField(controller: contraCtrl, obscureText: true, decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder()
              )),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: submit, child:
                Text(Login ? "INGRESAR" : "CREAR CUENTA")),
              ),
              TextButton(
                onPressed: () => setState(() => Login = !Login), 
                child: Text(Login ? "¿No tienes cuenta? Crea una" : "¿Ya tienes cuenta? Ingresa")
              )
            ],
          ),
        ),
     ),
   );
  }
}