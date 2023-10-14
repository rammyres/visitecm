import 'package:flutter/material.dart';
import 'package:visite_cm/telas/tela_sobre.dart';
import 'package:visite_cm/telas/tela_inicial.dart';
import 'package:visite_cm/telas/tela_favoritos.dart';

void main() => runApp(const VisiteCM());

class VisiteCM extends StatelessWidget {
  const VisiteCM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaInicial(),
        '/favoritos': (context) => TelaFavoritos(),
        '/sobre': (context) => TelaSobre(),
      },
    );
  }
}
