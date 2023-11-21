import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_player_model.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_team_detail_model.dart';
import 'package:mniii_flutter_daily_tracker/services/nba_api_service.dart';

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
  late Future<NBATeamDetailModel> nbaTeam;
  late Future<List<NBAPlayerModel>> nbaPlayers;

  @override
  void initState() {
    super.initState();
    nbaTeam = ApiService.fetchTeamById(widget.id);
    nbaPlayers = ApiService.fetchPlayersByTeamId(widget.id);
    print(nbaTeam);
    print(nbaPlayers);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
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
                    tag: widget.id,
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
                    return Column(
                      children: [
                        for (var player in snapshot.data!)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green.shade300,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${player.firstname}, ${player.lastname}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
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
