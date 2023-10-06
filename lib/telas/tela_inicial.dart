import 'package:flutter/material.dart';
import '../dados/atracoes.dart';
import '../ciomponentes/card_atracao.dart'; // Importe o widget CardAtracao
import '../modelos/atracao.dart';
import '../telas/tela_detalhes_atracao.dart'; // Importe a tela DetalhesAtracaoScreen

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String filtro = ""; // Variável para armazenar o texto de filtragem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindos a Campo Maior'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine o número de colunas com base no tamanho da tela
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = screenWidth > 600
              ? 3
              : screenWidth > 400
                  ? 2
                  : 1;

          // Filtra as atrações com base no texto de filtragem
          List<Atracao> atracoesFiltradas = atracoes.where((atracao) {
            final nomeAtracao = atracao.nome.toLowerCase();
            return nomeAtracao.contains(filtro.toLowerCase());
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filtro = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Filtrar por nome',
                    hintText: 'Digite o nome da atração',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  itemCount: atracoesFiltradas.length,
                  itemBuilder: (ctx, index) {
                    final atracao = atracoesFiltradas[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetalhesAtracaoScreen(atracao: atracao),
                          ),
                        );
                      },
                      child: CardAtracao(
                        atracao: atracao,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
