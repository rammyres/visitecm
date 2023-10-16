import 'package:visite_cm/modelos/atracao.dart';

// A classe OndeCeB (Onde comer e beber) é uma atração especial, designando
// bares e restaurantes, com uma estimativa de preço (caro, ok e barato)

class OndeCeB extends Atracao {
  final Preco preco;

  OndeCeB({
    required String id,
    required String nome,
    required List<String> fotos,
    required List<String> descricao,
    required String localizacao,
    required this.preco,
  }) : super(
          // Inicialização da superclasse
          id: id,
          nome: nome,
          fotos: fotos,
          descricao: descricao,
          localizacao: localizacao,
        );
}

// Indicativo de preços
enum Preco {
  caro,
  ok,
  barato,
}
