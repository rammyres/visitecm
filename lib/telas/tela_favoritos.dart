import 'package:flutter/material.dart';
import 'package:visite_cm/modelos/atracao.dart';
import 'package:visite_cm/modelos/ondeceb.dart';
import 'package:visite_cm/componentes/card_atracao.dart'; // Importe a classe CardAtracao ou substitua pelo seu componente
import 'package:visite_cm/componentes/card_ondeceb.dart'; // Importe a classe CardOndeceb ou substitua pelo seu componente
import 'package:visite_cm/componentes/favoritos.dart';
import 'package:visite_cm/dados/atracoes.dart'; // Importe a lista de atrações
import 'package:visite_cm/dados/ondecebs.dart'; // Importe a lista de ondecebs

class TelaFavoritos extends StatefulWidget {
  @override
  _TelaFavoritosState createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  List<String> favoritosAtracoes = [];
  List<String> favoritosOndecebs = [];

  @override
  void initState() {
    super.initState();
    carregarFavoritos();
  }

  // Carrega a lista de IDs de favoritos armazenados nas preferências compartilhadas
  void carregarFavoritos() async {
    favoritosAtracoes = await FavoritosManager.getFavoritosAtracoes();
    favoritosOndecebs = await FavoritosManager.getFavoritosCeBs();
    setState(() {}); // Atualiza a interface com as IDs de favoritos
  }

  // Encontra o objeto Atracao correspondente à ID
  Atracao encontrarAtracaoPorId(String atracaoId) {
    return atracoes.firstWhere((atracao) => atracao.id == atracaoId);
  }

  // Encontra o objeto Ondeceb correspondente à ID
  OndeCeB encontrarOndecebPorId(String ondecebId) {
    return ondecebs.firstWhere((ondeceb) => ondeceb.id == ondecebId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView(
        children: <Widget>[
          // Exibir atrações favoritas
          if (favoritosAtracoes.isNotEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Atrações Favoritas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ...favoritosAtracoes.map((atracaoId) {
            final atracao = encontrarAtracaoPorId(atracaoId);
            return CardAtracao(atracao: atracao);
          }).toList(),

          // Exibir ondecebs favoritos
          if (favoritosOndecebs.isNotEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Bares e Restaurantes Favoritos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ...favoritosOndecebs.map((ondecebId) {
            final ondeceb = encontrarOndecebPorId(ondecebId);
            return CardOndeCeB(ceb: ondeceb);
          }).toList(),
        ],
      ),
    );
  }
}
