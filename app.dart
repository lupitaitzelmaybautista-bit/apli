import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi cartera',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F8FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2776D2),
        ),
      ),
      home: const CarteraPage(),
    );
  }
}

class CarteraPage extends StatefulWidget {
  const CarteraPage({super.key});

  @override
  State<CarteraPage> createState() => _CarteraPageState();
}

class _CarteraPageState extends State<CarteraPage> {
  final TextEditingController _busquedaController = TextEditingController();
  int _seccionSeleccionada = 2;

  @override
  void dispose() {
    _busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
                children: [
                  const Text(
                    'VENDEDOR MÓVIL',
                    style: TextStyle(
                      color: Color(0xFF2776D2),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Mi cartera',
                    style: TextStyle(
                      color: Color(0xFF172536),
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Clientes disponibles',
                    style: TextStyle(
                      color: Color(0xFF8191A6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextField(
                    controller: _busquedaController,
                    decoration: InputDecoration(
                      hintText: 'Buscar cliente...',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA3B0C0),
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFFDCE4ED),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0xFF2776D2),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'No hay clientes disponibles',
                        style: TextStyle(
                          color: Color(0xFF8191A6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Barra de navegación inferior
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDCE4ED)),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 12),
              child: Row(
                children: [
                  _itemNav('Cotizaciones', 0),
                  _itemNav('Nueva', 1),
                  _itemNav('Clientes', 2),
                  _itemNav('Perfil', 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemNav(String texto, int indice) {
    final bool seleccionado = _seccionSeleccionada == indice;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          setState(() {
            _seccionSeleccionada = indice;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: seleccionado
                    ? const Color(0xFFEAF3FF)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                texto,
                style: TextStyle(
                  color: seleccionado
                      ? const Color(0xFF2776D2)
                      : const Color(0xFF8191A6),
                  fontSize: 11,
                  fontWeight:
                      seleccionado ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}