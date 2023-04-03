class Pokemon {
  final int id;
  final String name;
  final String base_experience;
  final String front_default;

  Pokemon(this.id, this.name, this.base_experience, this.front_default);

  factory Pokemon.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final int id = properties['id'];
    final String name = properties['name'];
    final String base_experience = properties['base_experience'];
    final String front_default = properties['front_default'];

    return Pokemon(id, name, base_experience, front_default);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'base_experience': base_experience,
      'front_default': front_default,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(json['id'], json['name'], json['base_experience'], json['front_default']);
  }
}
