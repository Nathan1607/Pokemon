/*
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart';

class ListPoke extends StatefulWidget {
  const ListPoke({super.key});

  @override
  State<ListPoke> createState() => _ListPokeState();
}

class _ListPokeState extends State<ListPoke> {
  List pokedex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon pokedex'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('data'),
          Text('data'),
          Text(pokedex[index]['name']),
        ],
      )),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https('https://pokeapi.co/api/v2/');
  }
}
*/