import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' as rootBundle;

import '../../models/idoso.dart';

Future<Idoso> fetchIdoso() async {
  final response = await http.get(Uri.parse(''));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(Idoso.fromJson(jsonDecode(response.body)));
    return Idoso.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
