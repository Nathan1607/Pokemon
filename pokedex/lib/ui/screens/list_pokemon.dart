import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../repositories/pokemon_repository.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({Key? key}) : super(key: key);

  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  List<Pokemon> _pokemons = [
    Pokemon(1, 'bulbasaur', '64',
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),
    Pokemon(2, 'ivysaur', '142',
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png'),
    Pokemon(2, 'ivysaur', '142',
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png'),
    Pokemon(2, 'ivysaur', '142',
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: _pokemons.length,
              itemBuilder: (context, index) {
                final Pokemon pokemon = _pokemons[index];
                return ListTile(
                  leading: FlutterLogo(),
                  // leading: ${pokemon.front_default},
                  title: Text(pokemon.name),
                  subtitle: Text('${pokemon.id} ${pokemon.base_experience}'),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
