import 'dart:convert';
import 'package:http/http.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> fetchPokemon() async {
    final Response response =
        await get(Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/'));
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

  Future<List<Pokemon>> fetchPokemonSearch(String idPokemon) async {
    final Response response = await get(
        Uri.parse('https://pokebuildapi.fr/api/v1/pokemon/$idPokemon'));
    if (response.statusCode == 200) {
      final List<Pokemon> pokemons = [];

      final Map<String, dynamic> jsons = jsonDecode(response.body);
      for (var json in jsons.values) {
        pokemons.add(Pokemon.fromJson(jsons));
      }
      return pokemons;
    }

    else {
      throw Exception('Failed to load Pokemon');
    }
  }
}

  // String limit = '1';
  

