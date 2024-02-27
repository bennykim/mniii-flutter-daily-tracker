import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_player_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Player extends StatelessWidget {
  const Player({
    super.key,
    required this.player,
    required this.teamName,
  });

  final String teamName;
  final NBAPlayerModel player;

  onButtonTap() async {
    await launchUrlString('https://nba.com/$teamName');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
