/*
class Pokedex {
  List<Pokemon> pokemon;

  Pokedex({this.pokemon});

  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  int id;
  String name;
  String height;
  String order;
  String weight;

  Pokemon({this.id, this.name, this.height, this.order, this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'];
    order = json['order'];
    weight = json['weight'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['height'] = this.height;
      data['order'] = this.order;
      data['weight'] = this.weight;

      return data;
    }
  }
}
*/