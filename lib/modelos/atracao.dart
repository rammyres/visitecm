class Atracao {
  final String id;
  final String nome;
  final String foto;
  final List<String> descricao;
  final String localizacao;
  double latitude = 0;
  double longitude = 0;

  Atracao({
    required this.id,
    required this.nome,
    required this.foto,
    required this.descricao,
    required this.localizacao,
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
