class Account {
  final int id;
  final String name;
  final String region;

  const Account(this.id,this.name, this.region);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region': region,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      json['id'],
      json['name'],
      json['region']
    );
  }
}
