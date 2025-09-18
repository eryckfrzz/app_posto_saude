class User {
  String cpf;
  String name;
  String birthday;
  String gender;
  String moreInfo;

  User({
    required this.cpf,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.moreInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthday': birthday,
      'gender': gender,
      'moreInfo': moreInfo,
      'cpf': cpf
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      birthday: json['birthday'],
      gender: json['gender'],
      moreInfo: json['moreInfo'],
      cpf: json['cpf']
    );
  }
}
