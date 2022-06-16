class Remedio {
  final String name;
  final String description;
  final String dosage;
  final String cpf;
  final int totalAmount;
  final int currentAmount;

  const Remedio({
    required this.name,
    required this.cpf,
    required this.description,
    required this.dosage,
    required this.totalAmount,
    required this.currentAmount,
  });

  Remedio.fromJson(Map json)
      : name = json['name'],
        cpf = json['cpf'],
        description = json['description'],
        dosage = json['dosage'],
        currentAmount = json['currentamount'],
        totalAmount = json['totalamount'];
  Map toJson() {
    return {
      'name': name,
      'cpf': cpf,
      'description': description,
      'dosage': dosage,
      'totalamount': totalAmount,
      'currentamount': currentAmount,
    };
  }
}
