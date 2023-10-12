import 'package:shared_preferences/shared_preferences.dart';

class FavoritosManager {
  // Método para obter a lista de atrações favoritas armazenadas nas configurações
  static Future<List<String>> getFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favoritos') ?? [];
  }

  // Método para adicionar uma atração favorita à lista
  static Future<void> adicionarFavorito(String atracaoId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritos = await getFavoritos();
    favoritos.add(atracaoId);
    await prefs.setStringList('favoritos', favoritos);
  }

  // Método para remover uma atração favorita da lista
  static Future<void> removerFavorito(String atracaoId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritos = await getFavoritos();
    favoritos.remove(atracaoId);
    await prefs.setStringList('favoritos', favoritos);
  }

  // Método para verificar se uma atração é favorita
  static Future<bool> isFavorito(String atracaoId) async {
    final favoritos = await getFavoritos();
    return favoritos.contains(atracaoId);
  }

  // Método para obter a lista de IDs de atrações favoritas
  static Future<List<String>> getFavoritosAtracoes() async {
    final favoritos = await getFavoritos();
    return favoritos.where((id) => id.startsWith('tur')).toList();
  }

  // Método para obter a lista de IDs de Onde CeB favoritos
  static Future<List<String>> getFavoritosCeBs() async {
    final favoritos = await getFavoritos();
    return favoritos.where((id) => id.startsWith('ceb')).toList();
  }
}
