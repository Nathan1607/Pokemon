import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/pokemon_repository.dart';
import '../models/pokemon.dart';

class PokemonCubbit extends Cubit<List<Pokemon>> {
  final PokemonRepository pokemonRepository;

  PokemonCubbit(this.pokemonRepository) : super([]);

  Future<void> loadPokemons() async {
    emit(await pokemonRepository.fetchPokemon());
  }

}
