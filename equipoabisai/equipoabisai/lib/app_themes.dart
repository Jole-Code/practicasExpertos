import 'package:flutter/material.dart';

class AppThemes {
  // Configuración del Modo Claro
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Gris casi blanco
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 54, 65, 230),       // Morado principal
      secondary: Color(0xFF03DAC6),     // Turquesa secundario
      tertiary: Color.fromRGBO(52, 206, 60, 1),      // Rosa terciario (para acentos)
      surface: Color(0xFFF8F9FA),        // Fondo principal
      surfaceContainer: Color(0xFFCFC4D8), // Gris claro para cards estructurales
    ),
  );

  // Configuración del Modo Oscuro
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF121212), // Negro mate
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC),       // Morado claro
      secondary: Color(0xFF03DAC6),     // Turquesa
      tertiary: Color(0xFFF48FB1),      // Rosa claro
      surface: Color(0xFF121212),       // Fondo principal oscuro
      surfaceContainer: Color(0xFF231035), // Gris muy oscuro para estructura
    ),
  );
}