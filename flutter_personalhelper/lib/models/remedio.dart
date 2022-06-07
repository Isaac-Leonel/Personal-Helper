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

  factory Remedio.fromJson(Map<String, dynamic> json) {
    return Remedio(
        name: json['name'],
        cpf: json['cpf'],
        description: json['description'],
        dosage: json['dosage']);
  }
}
