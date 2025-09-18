class Agent {
  String cpf;
  String name;
  String email;
  String password;

  Agent({
    required this.cpf,
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'cpf': cpf, 'name': name, 'email': email, 'password': password};
  }

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      cpf: json['cpf'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
