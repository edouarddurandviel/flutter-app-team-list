import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/members/models/Model_short_team.dart';
import 'package:myapp/members/models/Model_team.dart';

Future<Team> fetchMember(String id) async {
  final String url = "https://jsonplaceholder.typicode.com/users/$id";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    Map myResponse = jsonDecode(response.body);
    // then parse the JSON.
    return Team.fromJson(myResponse);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load City');
  }
}

Future<Members> fetchDetail(id) async {
  final String url = "https://jsonplaceholder.typicode.com/users/$id";

  final response = await http.get(url);

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    Map myResponse = jsonDecode(response.body);
    // then parse the JSON.
    return Members.fromJson(myResponse);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load City');
  }
}
