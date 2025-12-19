import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PantallaPadre(),
    );
  }
}

class PantallaPadre extends StatefulWidget {
  const PantallaPadre({super.key});

  @override
  State<PantallaPadre> createState() => _PantallaPadreState();
}

class _PantallaPadreState extends State<PantallaPadre> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lifting State Up"),
      ),
      body: Center(
        child: Hijo(
          valor: contador,
          onIncrementar: incrementar,
        ),
      ),
    );
  }
}

class Hijo extends StatelessWidget {
  final int valor;
  final VoidCallback onIncrementar;

  const Hijo({
    super.key,
    required this.valor,
    required this.onIncrementar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Valor: $valor",
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onIncrementar,
          child: const Text("Incrementar"),
        ),
      ],
    );
  }
}
