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
    _pokemons = PokemonRepository().fetchPokemonDetails(widget.idPokemon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du Pokémon'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                            elevation: 5.0,
                            child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Image.network(
                                snapshot.data![0].img.toString(),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      snapshot.data![0].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Card(
                              elevation: 5.0,
                              child: SizedBox(
                                  width: 200,
                                  height: 275,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    child: Text(
                                        'Statistiques : \n\n HP : ${snapshot.data![0].hp.toString()} \n\n Attaque : ${snapshot.data![0].attack.toString()} \n\n Defense : ${snapshot.data![0].defense.toString()} \n\n Attaque Spécial : ${snapshot.data![0].specialAttack.toString()} \n\n Défense spécial : ${snapshot.data![0].specialDefense.toString()} \n\n Vitesse : ${snapshot.data![0].speed.toString()}'),
                                  ))),
                          Card(
                            elevation: 5.0,
                            child: SizedBox(
                              width: 150,
                              height: 275,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 40),
                                child: Text(
                                  'Id du Pokemon: \n ${snapshot.data![0].idPokedex.toString()} \n\n\n Types : \n\n  ${snapshot.data![0].apiTypes.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', '')}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Card(
                            elevation: 5.0,
                            child: SizedBox(
                              width: 350,
                              height: 325,
                              child: Image.network(
                                  snapshot.data![0].sprite.toString(),
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      )
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
      ),
    );
  }
}
