class Remedio {
  final String name;
  final String description;
  final String dosage;
  final String cpf;

  const Remedio({
    required this.name,
    required this.cpf,
    required this.description,
    required this.dosage,
  });

  Remedio.fromJson(Map json)
      : name = json['name'],
        cpf = json['cpf'],
        description = json['description'],
        dosage = json['dosage'];
  Map toJson() {
    return {
      'name': name,
      'cpf': cpf,
      'description': description,
      'dosage': dosage
    };
  }
}
