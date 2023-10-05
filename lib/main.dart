import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
