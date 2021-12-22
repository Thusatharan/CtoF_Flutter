import 'dart:convert';

import 'package:ftoc/model/celcius_model.dart';
import 'package:http/http.dart' as http;

Future<Fahrenheit> convertFtoC(String celcius) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/ftoc'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'celcius': celcius,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Fahrenheit.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
