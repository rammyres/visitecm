import 'package:flutter/material.dart';
import 'tela_atracoes.dart'; // Importe a tela TelaAtracoes
import 'tela_ondecebs.dart';
import 'package:connectivity/connectivity.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  bool isConnected = true; // Variável para rastrear o status da conexão

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindos a Campo Maior'),
      ),
      body: RefreshIndicator(
        onRefresh: _checkConnection,
        child: ListView(
          children: [
            if (!isConnected)
              Container(
                // Exibir mensagem de falta de conexão
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'Sem conexão com a internet. Arraste para baixo para verificar.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            if (isConnected)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/atracoes');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         const TelaAtracoesTuristicas(), // Navegue para a tela de atrações
                    //   ),
                    // );
                  },
                  child: SizedBox(
                    width: screenWidth * 0.9, // Largura máxima de 80% da tela
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://piauihoje.com/uploads/imagens/5435139914-e1f187cbeb-b-1671742751.jpg', // URL da imagem da Serra de Santo Antônio
                            fit: BoxFit
                                .cover, // Ajuste a imagem ao tamanho do card
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Atrações Turísticas',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16), // Espaço entre os cards
            if (isConnected)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/ondecebs');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         const TelaOndeCeB(), // Navegue para a tela de Onde CeB
                    //   ),
                    // );
                  },
                  child: SizedBox(
                    width: screenWidth * 0.9, // Largura máxima de 80% da tela
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            'https://img.restaurantguru.com/r9e8-exterior-Churrascaria-Hawai-2022-10-1.jpg', // URL da imagem do Hawaii Grill
                            fit: BoxFit
                                .cover, // Ajuste a imagem ao tamanho do card
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Onde Comer e Beber',
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/favoritos'
              // MaterialPageRoute(
              //   builder: (context) =>
              //       TelaFavoritos(), // Navegue para a tela de favoritos
              // ),
              );
        },
        child: const Icon(Icons.favorite), // Ícone de coração
      ),
    );
  }
}
