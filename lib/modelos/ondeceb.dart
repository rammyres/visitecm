enum Preco {
  caro,
  ok,
  barato,
}

class OndeCeB {
  final String id;
  final String nome;
  final List<String> fotos;
  final List<String> descricao;
  final String localizacao;
  final Preco preco;
  double latitude = 0;
  double longitude = 0;

  OndeCeB({
    required this.id,
    required this.nome,
    required this.fotos,
    required this.descricao,
    required this.localizacao,
    required this.preco,
  }) {
    // Extrai as coordenadas de latitude e longitude da URL do Google Maps
    final regex = RegExp(r'@([-+]?\d+\.\d+),([-+]?\d+\.\d+)');
    final match = regex.firstMatch(localizacao);

    if (match != null && match.groupCount == 2) {
      latitude = double.tryParse(match.group(1)!) ?? 0;
      longitude = double.tryParse(match.group(2)!) ?? 0;
    }
  }
}
