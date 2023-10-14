import 'package:flutter/material.dart';

class AlunoCard extends StatelessWidget {
  final String nome;

  const AlunoCard({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(nome),
      ),
    );
  }
}
