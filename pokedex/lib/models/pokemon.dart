class Pokemon {
  int? id;
  int? idPokedex;
  String? name;
  String? img;
  String? sprite;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  List<String>? apiTypes;

  Pokemon({
    this.id,
    this.idPokedex,
    this.name,
    this.img,
    this.sprite,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.apiTypes,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      idPokedex: json['pokedexId'],
      name: json['name'],
      img: json['image'],
      sprite: json['sprite'],
      hp: json['stats']['HP'],
      attack: json['stats']['attack'],
      defense: json['stats']['defense'],
      specialAttack: json['stats']['special_attack'],
      specialDefense: json['stats']['special_defense'],
      speed: json['stats']['speed'],
      apiTypes: (json['apiTypes'] as List<dynamic>)
          .map((type) => type['name'].toString())
          .toList(),
    );
  }
}
