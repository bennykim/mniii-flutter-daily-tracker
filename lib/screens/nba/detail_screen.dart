import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba/nba_player_model.dart';
import 'package:mniii_flutter_daily_tracker/models/nba/nba_team_detail_model.dart';
import 'package:mniii_flutter_daily_tracker/services/nba/nba_api_service.dart';
import 'package:mniii_flutter_daily_tracker/widgets/nba/nba_player_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String name, logo;

  const DetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.logo,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const String likedTeamsKey = 'likedTeams';
  late Future<NBATeamDetailModel> nbaTeam;
  late Future<List<NBAPlayerModel>> nbaPlayers;
  late SharedPreferences pref;
  bool isLiked = false;
  late String teamIdString;

  @override
  void initState() {
    super.initState();
    nbaTeam = ApiService.fetchTeamById(widget.id);
    nbaPlayers = ApiService.fetchPlayersByTeamId(widget.id);
    teamIdString = widget.id.toString();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    pref = await SharedPreferences.getInstance();
    await checkIfTeamLiked();
  }

  Future<void> checkIfTeamLiked() async {
    final likedTeams = pref.getStringList(likedTeamsKey) ?? [];
    setState(() {
      isLiked = likedTeams.contains(teamIdString);
    });
  }

  Future<void> toggleFavorite() async {
    final likedTeams = pref.getStringList(likedTeamsKey) ?? [];
    isLiked ? likedTeams.remove(teamIdString) : likedTeams.add(teamIdString);
    await pref.setStringList(likedTeamsKey, likedTeams);
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
          ),
        ],
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: teamIdString,
                    child: Container(
                      width: 150,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(0, 0),
                                color: Colors.black.withOpacity(0.1))
                          ]),
                      child: Image.network(widget.logo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: nbaTeam,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data!.code} / ${snapshot.data!.city}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.nickname,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('Loading...');
                },
              ),
              const SizedBox(
                height: 40,
              ),
              FutureBuilder(
                future: nbaPlayers,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                        future: nbaTeam,
                        builder: (context,
                            AsyncSnapshot<NBATeamDetailModel> teamSnapshot) {
                          if (teamSnapshot.hasData) {
                            return Column(
                              children: [
                                for (var player in snapshot.data!)
                                  Player(
                                    player: player,
                                    teamName: teamSnapshot.data!.nickname,
                                  )
                              ],
                            );
                          }
                          return Container(); // 팀 정보 로딩 중일 때 표시할 위젯
                        });
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
