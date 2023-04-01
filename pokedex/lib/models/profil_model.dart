class Account {
  final int id;
  final String name;
  final String team;

  const Account(this.id,this.name, this.team);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'team': team,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['id'],
      json['name'],
      json['team']
    );
  }
}
