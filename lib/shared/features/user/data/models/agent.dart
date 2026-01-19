class Agent {
  String cpf;
  String name;
  String phone;
  String email;
  String password;

  Agent({
    required this.cpf,
    required this.name,
    required this.email,
    required this.password,
    required this.phone
  });

  Map<String, dynamic> toJson() {
    return {'cpf': cpf, 'name': name, 'email': email, 'password': password, 'phone': phone};
  }

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      cpf: json['cpf'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
    );
  }
}
