import 'package:flutter/material.dart';

class CardAtracao extends StatelessWidget {
  final String nome;
  final String fotoUrl;

  const CardAtracao({
    Key? key,
    required this.nome,
    required this.fotoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 200.0, // Defina a altura desejada
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                fotoUrl,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.transparent, Colors.blue.withOpacity(0.7)],
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              nome,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
