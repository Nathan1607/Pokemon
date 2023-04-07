import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../repositories/pokemon_repository.dart';
import '../../ui/screens/detail_pokemon.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({Key? key}) : super(key: key);

  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  late Future<List<Pokemon>> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = PokemonRepository().fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
        children: [
          /*TextField(
            onChanged: (value) async {
              if (value.length >= 3) {
                final PokemonSearchRepository pokemonRepository =
                    PokemonSearchRepository();
                List<Pokemon> pokemonsSearch =
                    await pokemonRepository.fetchPokemonSearch(value);
                setState(() {
                  // _pokemons = pok;
                });
              }
              print(value);
            },
          ),*/
          Expanded(
            child: FutureBuilder(
              future: _pokemons,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final pokemon = snapshot.data![index];
                      return Card(
                        elevation: 3.0,
                        semanticContainer: true,
                        child: Container(
                            margin: const EdgeInsets.all(20),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      DetailPokemon(
                                        idPokemon: pokemon.id.toString()
                                      )
                                  )
                                );
                              },
                              child: ListTile(
                                title: Text('${pokemon.name}'),
                                leading: Image.network(
                                  pokemon.img.toString(),
                                  width: 64,
                                  height: 64,
                                ),
                              ),
                            )),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Text("No pokemon");
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      )
    );
  }
}
