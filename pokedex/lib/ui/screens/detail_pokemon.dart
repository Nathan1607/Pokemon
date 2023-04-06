import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../repositories/pokemon_repository.dart';

class DetailPokemon extends StatefulWidget {
  final String idPokemon;
  const DetailPokemon({Key? key, required this.idPokemon}) : super(key: key);

  @override
  State<DetailPokemon> createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  late Future<List<Pokemon>> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = PokemonRepository().fetchPokemonSearch(widget.idPokemon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Pokémon'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _pokemons,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Card(
                          elevation: 4.0,
                          child: Image.network(snapshot.data![0].img.toString(), 
                            width: 200,
                            height: 100
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    child: Text(
                                      snapshot.data![0].name.toString(),
                                      style: const TextStyle(
                                       fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        // ),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(horizontal: 40),
                        //   child: Text(snapshot.data![0].name.toString()),
                        // ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('No Detail');
              } else {
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
