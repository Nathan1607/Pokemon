import 'package:flutter/material.dart';
import 'package:pokedex/ui/screens/list_pokemon.dart';
import 'package:pokedex/ui/screens/profil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _widgetOptions = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll([
      ListPokemon(),
      Profil(),
    ]);
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon pokedex'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Liste Pokemon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
