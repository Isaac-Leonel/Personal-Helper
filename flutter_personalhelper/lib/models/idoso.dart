class Idoso {
  final String name;
  final String cpf;
  final String birthday;
  final String email;
  final String password;
  final String rg;
  final String image;

  const Idoso(
      {required this.name,
      required this.cpf,
      required this.birthday,
      required this.email,
      required this.password,
      required this.rg,
      required this.image});

  factory Idoso.fromJson(Map<String, dynamic> json) {
    return Idoso(
      name: json['name'],
      cpf: json['cpf'],
      birthday: json['birthday'],
      email: json['email'],
      password: json['password'],
      rg: json['rg'],
      image: json['image'],
    );
  }
}
