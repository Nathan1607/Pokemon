class Account {
  int id;
  String name;
  String region;

  Account(this.id, this.name, this.region);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region': region,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(json['id'], json['name'], json['region']);
  }
}
