import 'dart:convert';
import 'package:http/http.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> fetchPokemon(String query) async {
    final Response response =
        await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$query'));
    if (response.statusCode == 200) {
      final List<Pokemon> pokemons = [];

      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("features")) {
        final List<dynamic> features = json['features'];

        for (Map<String, dynamic> feature in features) {
          final Pokemon pokemon = Pokemon.fromGeoJson(feature);
          pokemons.add(pokemon);
        }
      }
      return pokemons;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
