import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/atracao.dart';
import 'package:visite_cm/telas/tela_detalhes_atracao.dart';
import 'package:visite_cm/componentes/favoritos.dart';

class CardAtracao extends StatefulWidget {
  final Atracao atracao;

  const CardAtracao({
    Key? key,
    required this.atracao,
  }) : super(key: key);

  @override
  _CardAtracaoState createState() => _CardAtracaoState();
}

class _CardAtracaoState extends State<CardAtracao> {
  bool favorito = false;

  @override
  void initState() {
    super.initState();
    _verificarFavorito();
  }

  void _verificarFavorito() async {
    final favorito = await FavoritosManager.isFavorito(widget.atracao.id);
    if (mounted) {
      setState(() {
        this.favorito = favorito;
      });
    }
  }

  void _toggleFavorito() async {
    if (favorito) {
      await FavoritosManager.removerFavorito(widget.atracao.id);
    } else {
      await FavoritosManager.adicionarFavorito(widget.atracao.id);
    }
    if (mounted) {
      setState(() {
        favorito = !favorito;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a primeira imagem da lista de fotos da atração
    final String primeiraFoto =
        widget.atracao.fotos.isNotEmpty ? widget.atracao.fotos[0] : '';

    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  DetalhesAtracaoScreen(atracao: widget.atracao),
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
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
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
                  padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          favorito ? Icons.favorite : Icons.favorite_border,
                          color: favorito ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          _toggleFavorito();
                        },
                      ),
                      Text(
                        widget.atracao.nome.length > 12
                            ? widget.atracao.nome.substring(0, 12) + "..."
                            : widget.atracao.nome,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
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
}
