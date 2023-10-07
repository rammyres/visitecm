import 'package:flutter/material.dart';
import '../telas/tela_detalhes_atracao.dart';
import '../modelos/atracao.dart';

class CardAtracao extends StatelessWidget {
  final Atracao atracao;

  const CardAtracao({
    Key? key,
    required this.atracao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetalhesAtracaoScreen(atracao: atracao),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                atracao.foto,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Canto superior esquerdo
                  end: Alignment.bottomRight, // Canto inferior direito
                  colors: [
                    Colors.blue.withOpacity(0.4), // Diminuí a opacidade do azul
                    Colors.blue.withOpacity(0.0),
                  ],
                ),
              ),
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  atracao.nome,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
