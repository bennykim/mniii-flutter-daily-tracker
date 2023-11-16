import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_model.dart';
import 'package:mniii_flutter_daily_tracker/services/api_service.dart';
import 'package:mniii_flutter_daily_tracker/widgets/nba_team_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<NBAModel>> nbaTeams = ApiService.fetchNBATeams();

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

  ListView makeList(AsyncSnapshot<List<NBAModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var nbaTeam = snapshot.data![index];
        return NBATeamCard(
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
