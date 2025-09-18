class Record {
  final int id;
  final String name;
  final String birthday;
  final String gender;
  final String moreInfo;
  final String userCpf;

  Record({
    required this.id,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.moreInfo,
    required this.userCpf,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birthday': birthday,
      'gender': gender,
      'moreInfo': moreInfo,
      'userCpf': userCpf,
    };
  }

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      name: json['name'],
      birthday: json['birthday'],
      gender: json['gender'],
      moreInfo: json['moreInfo'],
      userCpf: json['userCpf'],
    );
  }
}
