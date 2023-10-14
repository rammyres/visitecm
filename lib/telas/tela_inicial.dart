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

  // Verifica o estado atual da conexão com a internet
  Future<void> verificarConexao() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      _connectivityResult = connectivityResult;
    });
  }

  @override
  void initState() {
    super.initState();
    verificarConexao(); // Verifica a conexão na inicialização da tela
  }

  // Ação de verificação quando o botão recarregar for acionado
  Future<void> _refresh() async {
    await verificarConexao();
  }

  // Constroi dinamicamente o botão flutuante do rodapé
  // Caso a conexão esteja inativa no momento da construção o botão será
  // um refresh, se não estiver o botão será o de favoritos
  Widget _construirBotaoFlutuante() {
    return FloatingActionButton(
      onPressed: () {
        if (_connectivityResult != ConnectivityResult.none) {
          _mostrarFavoritos();
        } else {
          _refresh();
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
    return DefaultTabController(
      length: 2, // Duas abas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tela Inicial'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sobre');
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Atrações'),
              Tab(text: 'Onde Comer e Beber'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _construirConteudoAtracoes(),
            _construirConteudoOndeCeB(),
          ],
        ),
        floatingActionButton: _construirBotaoFlutuante(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Constroi o conteúdo da aba atrações
  // O conteúd precisa ser criado dinamicamente para permitir a filtragem
  Widget _construirConteudoAtracoes() {
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
      final atracoesFiltradas = atracoes
          .where((atracao) =>
              atracao.nome.toLowerCase().contains(filtro.toLowerCase()))
          .toList();

      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  'https://i.ibb.co/T1bgMpK/image.png',
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Bem vindos a Campo Maior!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                      hintText: 'Digite o nome da atração',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: atracoesFiltradas
                  .map((atracao) => GestureDetector(
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
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    }
  }

  // Constroi o conteúdo da aba onde comer e beber
  // O conteúd precisa ser criado dinamicamente para permitir a filtragem
  Widget _construirConteudoOndeCeB() {
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
      final ondecebsFiltrados = ondecebs
          .where((ceb) => ceb.nome.toLowerCase().contains(filtro.toLowerCase()))
          .toList();

      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Column(
              children: ondecebsFiltrados
                  .map((ceb) => GestureDetector(
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
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    }
  }

  void _mostrarFavoritos() {
    setState(() {
      Navigator.pushNamed(context, '/favoritos');
    });
  }
}
