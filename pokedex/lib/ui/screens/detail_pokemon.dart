import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../repositories/pokemon_repository.dart';

class DetailPokemon extends StatefulWidget {
  const DetailPokemon({super.key});

  @override
  State<DetailPokemon> createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  late Future<List<Pokemon>> _pokemons;

  @override
  void initState() {
    super.initState();
    _pokemons = PokemonRepository().fetchPokemon();
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
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final pokemon = snapshot.data![index];
                    return Card(
                      semanticContainer: true,
                      child: Container( 
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.network(pokemon.img.toString(),
                            width: 100,
                            height: 100,
                            ),
                            Image.network(pokemon.sprite.toString()
                            ),

                            Container(
                              width: 100,
                              child: Text('data'),
                            ),
                            SizedBox(
                              height: 200,
                              width: 100,
                            ),
                            Container(
                              child: Text('data 1'),
                            ),
                          ],
                        ),
                        
                      ),
                      
                    );
                  },
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
