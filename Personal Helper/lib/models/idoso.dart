class Idoso {
  final String name;
  final String cpf;
  final String birthday;
  final String email;
//  final String password;
  final String rg;
//  final String image;
  final String street;
  final String neighborhood;
  final String city;
  final String number;
  final String emergencycontact;
  final String caregiver;

  const Idoso(
      {required this.name,
      required this.cpf,
      required this.birthday,
      required this.email,
      //   required this.password,
      required this.rg,
//required this.image,
      required this.street,
      required this.neighborhood,
      required this.city,
      required this.number,
      required this.emergencycontact,
      required this.caregiver});

  factory Idoso.fromJson(Map<String, dynamic> json) {
    return Idoso(
        name: json['name'],
        cpf: json['cpf'],
        birthday: json['birthday'],
        email: json['login'],
        //  password: json['password'],
        rg: json['rg'],
        //      image: json['image'],
        street: json['street'],
        neighborhood: json['neighborhood'],
        city: json['city'],
        emergencycontact: json['emergencyContact'],
        number: json['number'],
        caregiver: json['nameCaregiver']);
  }
}
