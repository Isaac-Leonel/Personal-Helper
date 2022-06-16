class Cuidador {
  final String cpf;
  final String login;
  final String name;
  final String birthday;
  final String schooling;
  final String street;
  final String neighborhood;
  final String city;
  final String complement;
  final String image;
  final int number;
  final String password;

  const Cuidador({
    required this.name,
    required this.cpf,
    required this.birthday,
    required this.password,
    required this.image,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.number,
    required this.complement,
    required this.login,
    required this.schooling,
  });

  factory Cuidador.fromJson(Map<String, dynamic> json) {
    return Cuidador(
        name: json['name'],
        cpf: json['cpf'],
        birthday: json['birthday'],
        password: json['password'],
        image: json['image'],
        street: json['street'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        number: json['number'],
        complement: json['complement'],
        login: json['login'],
        schooling: json['schooling']);
  }
}
