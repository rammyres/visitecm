import 'package:flutter/material.dart';
import '../dados/atracoes.dart';
import '../componentes/card_atracao.dart'; // Importe o widget CardAtracao
import '../modelos/atracao.dart';
import '../telas/tela_detalhes_atracao.dart'; // Importe a tela DetalhesAtracaoScreen

class TelaAtracoesTuristicas extends StatefulWidget {
  const TelaAtracoesTuristicas({Key? key}) : super(key: key);

  @override
  _TelaAtracoesTuristicasState createState() => _TelaAtracoesTuristicasState();
}

class _TelaAtracoesTuristicasState extends State<TelaAtracoesTuristicas> {
  String filtro = ""; // Variável para armazenar o texto de filtragem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atrações turisticas'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine o número de colunas com base no tamanho da tela
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = screenWidth > 600
              ? 3
              : screenWidth > 400
                  ? 2
                  : 2; // Valor mínimo definido como 2

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
