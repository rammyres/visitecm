import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/ondeceb.dart';
import 'package:visite_cm/telas/tela_detalhes_ceb.dart';

class CardOndeCeB extends StatelessWidget {
  final OndeCeB ceb;

  const CardOndeCeB({
    Key? key,
    required this.ceb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String primeiraFoto = ceb.fotos.isNotEmpty ? ceb.fotos[0] : '';

    String precoIndicator = '';
    switch (ceb.preco) {
      case Preco.caro:
        precoIndicator = '\$\$\$';
        break;
      case Preco.ok:
        precoIndicator = '\$\$';
        break;
      case Preco.barato:
        precoIndicator = '\$';
        break;
    }

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetalhesCeBScreen(ceb: ceb),
            ),
          );
        },
        child: Hero(
          tag: primeiraFoto,
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
                    ceb.nome,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    precoIndicator,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: precoColor(ceb.preco),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color precoColor(Preco preco) {
    switch (preco) {
      case Preco.caro:
        return Colors.red;
      case Preco.ok:
        return Colors.orange;
      case Preco.barato:
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
