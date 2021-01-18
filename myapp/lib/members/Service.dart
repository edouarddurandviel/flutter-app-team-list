import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/members/models/Model_short_team.dart';
import 'package:myapp/members/models/Model_team.dart';

Future<Team> fetchMember(String id) async {
  final String url = "https://jsonplaceholder.typicode.com/users/$id";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    Map myResponse = jsonDecode(response.body);
    return Team.fromJson(myResponse);
  } else {
    throw Exception('Failed to load City');
  }
}

Future<Members> fetchDetail(id) async {
  final String url = "https://jsonplaceholder.typicode.com/users/$id";

  final response = await http.get(url);

  print(response.body);

  if (response.statusCode == 200) {
    Map myResponse = jsonDecode(response.body);
    return Members.fromJson(myResponse);
  } else {
    throw Exception('Failed to load City');
  }
}
