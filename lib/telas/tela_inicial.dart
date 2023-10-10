import 'package:flutter/material.dart';
import 'tela_atracoes.dart'; // Importe a tela TelaAtracoes
import 'tela_ondecebs.dart'; // Importe a tela TelaOndeCeB

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindos a Campo Maior'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TelaAtracoesTuristicas(), // Navegue para a tela de atrações
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity, // Largura máxima de 80% da tela
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        'https://piauihoje.com/uploads/imagens/5435139914-e1f187cbeb-b-1671742751.jpg', // URL da imagem da Serra de Santo Antônio
                        fit: BoxFit.cover, // Ajuste a imagem ao tamanho do card
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
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TelaOndeCeB(), // Navegue para a tela de Onde CeB
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity, // Largura máxima de 80% da tela
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://img.restaurantguru.com/r9e8-exterior-Churrascaria-Hawai-2022-10-1.jpg', // URL da imagem do Hawaii Grill
                        fit: BoxFit.cover, // Ajuste a imagem ao tamanho do card
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
    );
  }
}
