import 'package:flutter/material.dart';
import 'package:visite_cm/dados/ondecebs.dart';
import 'package:visite_cm/dados/atracoes.dart';
import 'package:visite_cm/telas/tela_detalhes_ceb.dart';
import 'package:visite_cm/componentes/card_atracao.dart';
import 'package:visite_cm/componentes/card_ondeceb.dart';
import 'package:visite_cm/telas/tela_detalhes_atracao.dart';
import 'package:connectivity/connectivity.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String filtro = "";
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  int calculateCrossAxisCount(double width) {
    if (width > 600) {
      return 3;
    } else if (width > 400) {
      return 2;
    } else {
      return 1;
    }
  }

  Future<void> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      _connectivityResult = connectivityResult;
    });
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> _refresh() async {
    await checkConnectivity();
    // Adicione aqui a lógica para atualizar a página, se necessário.
  }

  Widget _buildButton() {
    return FloatingActionButton(
      onPressed: () {
        if (_connectivityResult != ConnectivityResult.none) {
          _showFavorites(); // Navegar para a tela de favoritos
        } else {
          _refresh(); // Atualizar a página
        }
      },
      child: Icon(
        _connectivityResult != ConnectivityResult.none
            ? Icons.favorite
            : Icons.refresh,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tela Inicial'),
      // ),
      body: _buildContent(),
      floatingActionButton: _buildButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildContent() {
    if (_connectivityResult == ConnectivityResult.none) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning,
              size: 100,
              color: Colors.red,
            ),
            Text(
              'Sem conexão com a internet',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            Text(
              'Clique no botão de atualizar para verificar a conexão.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    } else {
      return LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = calculateCrossAxisCount(screenWidth);

          final atracoesFiltradas = atracoes
              .where((atracao) =>
                  atracao.nome.toLowerCase().contains(filtro.toLowerCase()))
              .toList();

          final ondecebsFiltrados = ondecebs
              .where((ceb) =>
                  ceb.nome.toLowerCase().contains(filtro.toLowerCase()))
              .toList();

          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Image.network(
                      'https://i.ibb.co/T1bgMpK/image.png',
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 100,
                      left: 50,
                      right: 10,
                      child: Text(
                        "Bem vindos a Campo Maior!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 10,
                      right: 10,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            filtro = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Filtrar por nome',
                          hintText: 'Digite o nome da atração ou ceb',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/sobre');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Atrações turísticas",
                    style: TextStyle(
                      fontFamily: "Verdana",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
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
                  childCount: atracoesFiltradas.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Onde comer e beber",
                    style: TextStyle(
                      fontFamily: "Verdana",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
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
                  childCount: ondecebsFiltrados.length,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void _showFavorites() {
    // Implemente a lógica para mostrar os favoritos aqui.
    setState(() {
      Navigator.pushNamed(context, '/favoritos');
    });
  }
}
