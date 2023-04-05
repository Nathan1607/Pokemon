class Pokemon {
  int? id;
  String? name;
  String? img;
  String? sprite;
  int? hp;

  Pokemon({this.id, this.name, this.img, this.sprite, this.hp});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      img: json['image'],
      sprite: json['sprite'],
      hp: json['stats']['HP'],
    );
  }
}
