class User {
  String cpf;
  String name;
  int phone;

  User({required this.cpf, required this.name, required this.phone});

  Map<String, dynamic> toJson() {
    return {'name': name, 'cpf': cpf, 'phone': phone};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], cpf: json['cpf'], phone: json['phone']);
  }
}
