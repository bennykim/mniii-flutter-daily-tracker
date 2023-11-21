import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mniii_flutter_daily_tracker/models/nba_detail_model.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_model.dart';

class ApiService {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static const String host = 'api-nba-v1.p.rapidapi.com';
  static const String teamsEndpoint = '/teams';

  static Future<http.Response> makeGetRequest(Uri url) async {
    return await http.get(url, headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    });
  }

  static Future<List<NBAModel>> fetchNBATeams() async {
    final apiUrl = Uri.https(host, teamsEndpoint);
    final response = await makeGetRequest(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> nbaTeamsList = jsonDecode(response.body)['response'];
      return nbaTeamsList
          .map((teamData) => NBAModel.fromJson(teamData))
          .toList();
    } else {
      throw Exception('Failed to fetch NBA teams');
    }
  }

  static Future<NBADetailModel> getTeamById(int id) async {
    final apiUrl = Uri.https(host, teamsEndpoint, {'id': id.toString()});
    final response = await makeGetRequest(apiUrl);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final dynamic nbaTeam = jsonData['response'][0];
      return NBADetailModel.fromJson(nbaTeam);
    } else {
      throw Exception('Failed to fetch NBA team by ID');
    }
  }
}
