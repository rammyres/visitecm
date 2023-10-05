import 'package:flutter/material.dart';

class CardAtracao extends StatelessWidget {
  final String nome;
  final String fotoUrl;

  const CardAtracao({
    super.key,
    required this.nome,
    required this.fotoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.network(
            fotoUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
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
