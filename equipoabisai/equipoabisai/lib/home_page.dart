import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  // --- VARIABLES DE DATOS (MODIFICAR A TUS DATOS) ---
  final String nombreUsuario = "José Luis Encarnación García";
  final String correoUsuario = "joluencarnacionga@ittepic.edu.mx";
  final String numControl = "21400672";
  final String rutaImagen = 'assets/hormiga3.png'; //No olvides cargar tu foto

  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sirve para obtener las paletas de colores
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // [FONDO]
      backgroundColor: colorScheme.surface,

      appBar: AppBar(
        // [PRIMARIO]
        backgroundColor: colorScheme.primary,
        // [ADAPTAR DINÁMICAMENTE AL FONDO]
        foregroundColor: colorScheme.onPrimary,
        title: const Text('Mi app Temática'),
        actions: [
          Icon(
            isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
            color: isDarkMode ? Colors.yellow : Colors.orange,
          ),
          Switch(
            value: isDarkMode,
            onChanged: onThemeChanged,
            // [SECUNDARIO]
            inactiveThumbColor: colorScheme.secondary,
            // [TERCIARIO]
            activeThumbColor: colorScheme.tertiary,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- TARJETA DE PERFIL ---
            Card(
              elevation: 4,
              // [COLOR FONDO AUXILIAR]
              color: colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // Columna de Foto
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            // [FONDO]
                            color: colorScheme.surface,
                            shape: BoxShape.circle,
                            // [PRIMARIO]
                            border: Border.all(color: colorScheme.primary, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              rutaImagen, // Variable declarada al inicio
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                    Icons.person,
                                    size: 60,
                                    // [PRIMARIO]
                                    color: colorScheme.primary
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    const SizedBox(width: 20),
                    // Columna de Datos
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nombreUsuario, // Variable declarada al inicio
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              // [PRIMARIO]
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            correoUsuario, // Variable declarada al inicio
                            style: TextStyle(
                              fontSize: 14,
                              // [ADAPTAR DINÁMICAMENTE AL FONDO]
                              color: colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            'No. Control: $numControl', // Variable declarada al inicio
                            style: TextStyle(
                              fontSize: 12,
                              // [ADAPTAR DINÁMICAMENTE AL FONDO]
                              color: colorScheme.onSurface
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
                "Jerarquía de Colores",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // [PRIMARIO]
                    color: colorScheme.primary
                ),
              ),
            const SizedBox(height: 10),

            // --- TARJETAS PARA EDITAR ---

            Expanded(
              flex: 4,
              child: _TarjetaColor(
                // [PRIMARIO]
                colorFondo: colorScheme.primary,
                texto: 'Primario',
                // [ADAPTAR DINÁMICAMENTE AL FONDO]
                colorTexto: colorScheme.onPrimary,
              ),
            ),
            Expanded(
              flex: 3,
              child: _TarjetaColor(
                // [SECUNDARIO]
                texto: 'Secundario',
                colorFondo: colorScheme.secondary,
                // [ADAPTAR DINÁMICAMENTE AL FONDO]
                colorTexto: colorScheme.onSecondary
              ),
            ),
            Expanded(
              flex: 2,
              child: _TarjetaColor(
                // [TERCIARIO]
                texto: 'Terciario',
                colorFondo: colorScheme.tertiary,
                // [ADAPTAR DINÁMICAMENTE AL FONDO]
                colorTexto: colorScheme.onTertiary
              ),
            ),
            Expanded(
              flex: 1,
              child: _TarjetaColor(
                // [COLOR FONDO AUXILIAR]
                texto: 'Color de fondo 2', // Cambio de texto solicitado
                colorFondo: colorScheme.surfaceContainer,
                colorTexto: colorScheme.onSurface,
                conBorde: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------- WIDGET PARA QUE PUEDAN PROBAR LOS COLORES
class _TarjetaColor extends StatelessWidget {
  final Color colorFondo;
  final String texto;
  final Color colorTexto;
  final bool conBorde;

  const _TarjetaColor({
    required this.colorFondo,
    required this.texto,
    required this.colorTexto,
    this.conBorde = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(12),
        border: conBorde
            ? Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.4))
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        texto,
        style: TextStyle(
          color: colorTexto,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}