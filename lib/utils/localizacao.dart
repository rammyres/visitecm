double latitude(localizacao) {
  final uri = Uri.parse(localizacao);
  final queryParameters = uri.queryParameters;
  final locationQuery = queryParameters['q'];

  late double latitude;

  if (locationQuery != null) {
    // O padrão da query 'q=' no Google Maps é 'latitude,longitude'.
    final coordinates = locationQuery.split(',');
    if (coordinates.length == 2) {
      latitude = double.tryParse(coordinates[0])!;
    }
  }
  return latitude;
}
