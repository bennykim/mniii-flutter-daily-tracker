import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AppService {
  String get apiKey => dotenv.env['API_KEY'] ?? '';

  final String host = 'api-nba-v1.p.rapidapi.com';
  final String teamsEndpoint = '/teams';

  void getNBATeams() async {
    final url = Uri.https(host, teamsEndpoint);
    final response = await http.get(url, headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
