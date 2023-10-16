// Definite a classe atração, que é a base do App.
// Cada atração possui uma id, que será usada para gestão dos favoritos,
// um nome, uma descrição, que é uma lista de strings que comporão os paragrafos
// da atração e uma lista de fotos, que será usada para mostrar a atração numa
// tela correspondente.

class Atracao {
  final String id;
  final String nome;
  final List<String> fotos;
  final List<String> descricao;
  final String localizacao;
  double latitude = 0;
  double longitude = 0;

  Atracao({
    required this.id,
    required this.nome,
    required this.fotos,
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
