import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/ondeceb.dart';
import 'package:visite_cm/telas/tela_detalhes_ceb.dart';
import 'package:visite_cm/componentes/favoritos.dart';

class CardOndeCeB extends StatefulWidget {
  final OndeCeB ceb;

  const CardOndeCeB({
    Key? key,
    required this.ceb,
  }) : super(key: key);

  @override
  _CardOndeCeBState createState() => _CardOndeCeBState();
}

class _CardOndeCeBState extends State<CardOndeCeB> {
  bool isFavorito = false;

  @override
  void initState() {
    super.initState();
    // Verifique se a atração é um favorito ao inicializar o widget
    FavoritosManager.isFavorito(widget.ceb.id).then((favorito) {
      setState(() {
        isFavorito = favorito;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String primeiraFoto =
        widget.ceb.fotos.isNotEmpty ? widget.ceb.fotos[0] : '';

    String precoIndicator = '';
    switch (widget.ceb.preco) {
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
              builder: (context) => DetalhesCeBScreen(ceb: widget.ceb),
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
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 8.0, // Ajuste a posição vertical
                right: 8.0, // Ajuste a posição horizontal
                child: Material(
                  // Adicione um Material widget
                  color: Colors.transparent, // Defina a cor transparente
                  child: Text(
                    precoIndicator,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: precoColor(widget.ceb.preco),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0, // Ajuste a posição vertical
                left: 8.0, // Ajuste a posição horizontal
                child: Material(
                  // Adicione um Material widget
                  color: Colors.transparent, // Defina a cor transparente
                  child: IconButton(
                    icon: Icon(
                      isFavorito ? Icons.favorite : Icons.favorite_border,
                      color: isFavorito ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      // Alterne o status de favorito quando o ícone de favorito for pressionado
                      setState(() {
                        isFavorito = !isFavorito;
                      });

                      // Adicione ou remova a atração da lista de favoritos
                      if (isFavorito) {
                        FavoritosManager.adicionarFavorito(widget.ceb.id);
                      } else {
                        FavoritosManager.removerFavorito(widget.ceb.id);
                      }
                    },
                  ),
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
                    widget.ceb.nome,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
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
