import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart';

void main() => runApp(const VisiteCM());

class VisiteCM extends StatelessWidget {
  const VisiteCM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        // Adicione a rota para a tela de detalhes da atração aqui
        // Exemplo: '/detalhes': (context) => DetalhesAtracaoScreen(),
      },
    );
  }
}
