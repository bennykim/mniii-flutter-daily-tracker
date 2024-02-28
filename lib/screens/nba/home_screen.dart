import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba/nba_team_model.dart';
import 'package:mniii_flutter_daily_tracker/services/nba/nba_api_service.dart';
import 'package:mniii_flutter_daily_tracker/widgets/nba/nba_team_card_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<NBATeamModel>> nbaTeams = ApiService.fetchNBATeams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          'NBA Teams',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: FutureBuilder(
        future: nbaTeams,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: makeList(snapshot),
              )
            ]);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<NBATeamModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var nbaTeam = snapshot.data![index];
        return NBATeamCardWidget(
            id: nbaTeam.id, name: nbaTeam.name, logo: nbaTeam.logo);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
