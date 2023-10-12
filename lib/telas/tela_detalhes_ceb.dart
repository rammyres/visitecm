import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/ondeceb.dart'; // Importe o modelo OndeCeB

class DetalhesCeBScreen extends StatelessWidget {
  final OndeCeB ceb;

  DetalhesCeBScreen({required this.ceb});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ceb.nome),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Voltar para a tela anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: ceb.fotos[0], // Use a URL da primeira imagem como tag Hero
              child: Image.network(
                ceb.fotos[0], // Exibe a primeira foto na tela de detalhes
                fit: BoxFit.cover,
                height: 200.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ceb.nome,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ceb.descricao.map((paragrafo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paragrafo,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0), // Espaço entre os parágrafos
                    ],
                  );
                }).toList(),
              ),
            ),
            // Aqui você pode adicionar mais informações dos locais OndeCeB, se necessário
          ],
        ),
      ),
    );
  }
}
