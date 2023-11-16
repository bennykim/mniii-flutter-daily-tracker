import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mniii_flutter_daily_tracker/models/nba_model.dart';

class ApiService {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static const String host = 'api-nba-v1.p.rapidapi.com';
  static const String teamsEndpoint = '/teams';

  static Future<List<NBAModel>> fetchNBATeams() async {
    List<NBAModel> nbaTeamInstances = [];

    final apiUrl = Uri.https(host, teamsEndpoint);

    final response = await http.get(apiUrl, headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    });

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> nbaTeamsList = jsonData['response'];

      for (var nbaTeamData in nbaTeamsList) {
        final instance = NBAModel.fromJson(nbaTeamData);
        nbaTeamInstances.add(instance);
      }

      return nbaTeamInstances;
    } else {
      throw Exception('Failed to fetch NBA teams');
    }
  }
}
