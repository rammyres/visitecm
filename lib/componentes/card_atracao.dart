import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/atracao.dart';
import 'package:visite_cm/telas/tela_detalhes_atracao.dart';

class CardAtracao extends StatelessWidget {
  final Atracao atracao;

  const CardAtracao({
    Key? key,
    required this.atracao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a primeira imagem da lista de fotos da atração
    final String primeiraFoto =
        atracao.fotos.isNotEmpty ? atracao.fotos[0] : '';

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
        child: Hero(
          tag: primeiraFoto, // Use a URL da primeira imagem como tag Hero
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  primeiraFoto,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.blue.withOpacity(0.1), // Azul suave
                        Colors.blue.withOpacity(0.0), // Transparente
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 8.0),
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
      ),
    );
  }
}
