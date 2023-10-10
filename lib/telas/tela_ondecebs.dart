import 'package:flutter/material.dart';
import '../dados/ondecebs.dart'; // Importe a lista de objetos OndeCeB
import '../componentes/card_ondeceb.dart'; // Importe o widget CardOndeCeB
import '../modelos/ondeceb.dart';
import '../telas/tela_detalhes_ceb.dart'; // Importe a tela DetalhesOndeCeBScreen

class TelaOndeCeB extends StatefulWidget {
  const TelaOndeCeB({Key? key}) : super(key: key);

  @override
  _TelaOndeCeBState createState() => _TelaOndeCeBState();
}

class _TelaOndeCeBState extends State<TelaOndeCeB> {
  String filtro = ""; // Variável para armazenar o texto de filtragem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locais Onde Comer e Beber'),
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

          // Filtra os locais OndeCeB com base no texto de filtragem
          List<OndeCeB> ondecebsFiltrados = ondecebs.where((ceb) {
            final nomeCeb = ceb.nome.toLowerCase();
            return nomeCeb.contains(filtro.toLowerCase());
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
                    hintText: 'Digite o nome do local',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                  itemCount: ondecebsFiltrados.length,
                  itemBuilder: (ctx, index) {
                    final ceb = ondecebsFiltrados[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesCeBScreen(ceb: ceb),
                          ),
                        );
                      },
                      child: CardOndeCeB(
                        ceb: ceb,
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
