import 'package:flutter/material.dart';
import 'package:visite_cm/componentes/card_aluno.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alunos que participaram do \n desenvolvimento do app:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            AlunoCard(nome: 'Euricélia'),
            AlunoCard(nome: 'Kauane'),
            AlunoCard(nome: 'Carlos Vinicius'),
            AlunoCard(nome: 'Douglas'),
            AlunoCard(nome: 'Thalisson'),
            AlunoCard(nome: 'Bruno'),
          ],
        ),
      ),
    );
  }
}
