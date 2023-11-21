import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mniii_flutter_daily_tracker/models/nba_player_model.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_team_detail_model.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_team_model.dart';

class ApiService {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static const String host = 'api-nba-v1.p.rapidapi.com';
  static const String teamsEndpoint = '/teams';
  static const String playersEndpoint = '/players';

  static Future<http.Response> makeGetRequest(Uri url) async {
    return await http.get(url, headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    });
  }

  static Future<List<NBATeamModel>> fetchNBATeams() async {
    final apiUrl = Uri.https(host, teamsEndpoint);
    final response = await makeGetRequest(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> nbaTeamList = jsonDecode(response.body)['response'];
      return nbaTeamList
          .map((teamData) => NBATeamModel.fromJson(teamData))
          .toList();
    } else {
      throw Exception('Failed to fetch NBA teams');
    }
  }

  static Future<NBATeamDetailModel> fetchTeamById(int id) async {
    final apiUrl = Uri.https(host, teamsEndpoint, {'id': id.toString()});
    final response = await makeGetRequest(apiUrl);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final dynamic nbaTeam = jsonData['response'][0];
      return NBATeamDetailModel.fromJson(nbaTeam);
    } else {
      throw Exception('Failed to fetch NBA team by ID');
    }
  }

  static Future<List<NBAPlayerModel>> fetchPlayersByTeamId(int id) async {
    final apiUrl = Uri.https(
        host, playersEndpoint, {'team': id.toString(), 'season': '2021'});
    final response = await makeGetRequest(apiUrl);

    if (response.statusCode == 200) {
      final List<dynamic> nbaPlayerList = jsonDecode(response.body)['response'];
      return nbaPlayerList
          .map((playerData) => NBAPlayerModel.fromJson(playerData))
          .toList();
    } else {
      throw Exception('Failed to fetch NBA team by ID');
    }
  }
}
