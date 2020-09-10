import 'package:myapp/members/models/Model_short_team.dart';
import 'package:myapp/members/DB_provider.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  static final ApiProvider api = ApiProvider._();

  ApiProvider._();

  getCreateEmployees(id) async {
    var url = "https://jsonplaceholder.typicode.com/users/$id";
    Response response = await Dio().get(url);

    DBProvider.db.createEmployee(Team.fromJson(response.data));
  }

  getEmployees(id) async {
    var url = "https://jsonplaceholder.typicode.com/users/$id";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to load City');
    }
  }

  fetchMember(String id) async {
    final String url = "https://jsonplaceholder.typicode.com/users/$id";

    Response response = await Dio().get(url);
    print(response.data);
    if (response.statusCode == 200) {
      // then parse the JSON.
      return response.data;
    } else {
      throw Exception('Failed to load City');
    }
  }
}
