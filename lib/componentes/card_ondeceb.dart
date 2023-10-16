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
  bool favorito = false;

  @override
  void initState() {
    super.initState();
    _verificarFavorito();
  }

  void _verificarFavorito() async {
    final favorito = await FavoritosManager.isFavorito(widget.ceb.id);
    if (mounted) {
      setState(() {
        this.favorito = favorito;
      });
    }
  }

  void _toggleFavorito() async {
    if (favorito) {
      await FavoritosManager.removerFavorito(widget.ceb.id);
    } else {
      await FavoritosManager.adicionarFavorito(widget.ceb.id);
    }
    if (mounted) {
      setState(() {
        favorito = !favorito;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String primeiraFoto =
        widget.ceb.fotos.isNotEmpty ? widget.ceb.fotos[0] : '';

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
                top: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: precoColor(widget.ceb.preco),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    precoIndicator(widget.ceb.preco),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.blue.withOpacity(0.4),
                        Colors.blue.withOpacity(0.0),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(
                            favorito ? Icons.favorite : Icons.favorite_border,
                            color: favorito ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            _toggleFavorito();
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.ceb.nome,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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

  String precoIndicator(Preco preco) {
    switch (preco) {
      case Preco.caro:
        return '\$\$\$';
      case Preco.ok:
        return '\$\$';
      case Preco.barato:
        return '\$';
      default:
        return '';
    }
  }
}
