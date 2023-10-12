import 'package:flutter/material.dart';
import 'telas/tela_inicial.dart';
import 'package:visite_cm/telas/tela_atracoes.dart';
import 'package:visite_cm/telas/tela_favoritos.dart';
import 'package:visite_cm/telas/tela_ondecebs.dart';

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
        '/atracoes': (context) => const TelaAtracoesTuristicas(),
        '/ondecebs': (context) => const TelaOndeCeB(),
      },
    );
  }
}
