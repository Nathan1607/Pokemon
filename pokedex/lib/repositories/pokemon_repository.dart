import 'dart:convert';
import 'package:http/http.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  // String limit = '1';

  Future<List<Pokemon>> fetchPokemon() async {
    final Response response = await get(
        Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/'));
    if (response.statusCode == 200) {
      final List<Pokemon> pokemons = [];

      final List<dynamic> json = jsonDecode(response.body);

      json.forEach((element) {
        final Pokemon pokemon = Pokemon.fromJson(element);
        pokemons.add(pokemon);        
      });
      return pokemons;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}

class PokemonSearchRepository {
  // String limit = '1';

  Future<List<Pokemon>> fetchPokemonSearch(String query) async {
    final Response response = await get(
        Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/$query'));
    if (response.statusCode == 200) {
      final List<Pokemon> pokemons = [];

      final List<dynamic> json = jsonDecode(response.body);

      json.forEach((element) {
        final Pokemon pokemon = Pokemon.fromJson(element);
        pokemons.add(pokemon);        
      });
      return pokemons;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
}
