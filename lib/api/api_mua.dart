import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yourmuaa/model/mua.dart';

class ApiMua {
  static const String baseUrl = 'https://644fe77bb61a9f0c4d2e7b70.mockapi.io';
  static const String specialists = '/specialist';

  static Future<List<Specialist>> getSpecialist() async {
    final response = await http.get(Uri.parse('$baseUrl$specialists'));

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Specialist> specialists =
          body.map((e) => Specialist.fromJson(e)).toList();
      print(specialists);
      return specialists;
    } else {
      throw "Can't get the data";
    }
  }

  static Future<Specialist> getSpecialistById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl$specialists/$id'));
    if (response.statusCode == 200) {
      final dynamic body = jsonDecode(response.body);
      print('Body: $body');
      final Specialist specialist = Specialist.fromJson(body);
      return specialist;
    } else {
      throw "Can't get the data";
    }
  }
}
