import 'package:flutter/material.dart';
import '../dados/atracoes.dart';
import '../ciomponentes/card_atracao.dart'; // Importe o widget CardAtracao
import '../telas/tela_detalhes_atracao.dart'; // Importe a tela DetalhesAtracaoScreen

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visite Campo Maior'),
      ),
      body: ListView.builder(
        itemCount: atracoes.length,
        itemBuilder: (ctx, index) {
          final atracao = atracoes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesAtracaoScreen(atracao: atracao),
                ),
              );
            },
            child: CardAtracao(
              nome: atracao.nome,
              fotoUrl: atracao.foto,
            ),
          );
        },
      ),
    );
  }
}
