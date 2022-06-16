import 'dart:ffi';

class Lembrete {
  final String name;
  final String description;
  final String dateRemider;

  const Lembrete(
      {required this.name,
      required this.description,
      required this.dateRemider});

  Lembrete.fromJson(Map json)
      : name = json['name'],
        description = json['description'],
        dateRemider = json['dateRemider'];

  Map toJson() {
    return {
      'name': name,
      'description': description,
      'dateRemider': dateRemider
    };
  }
}
