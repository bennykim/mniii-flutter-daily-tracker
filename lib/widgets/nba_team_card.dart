import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/screens/detail_screen.dart';

class NBATeamCard extends StatelessWidget {
  final int id;
  final String name, logo;

  const NBATeamCard({
    super.key,
    required this.id,
    required this.name,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(id: id, name: name, logo: logo),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
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
              child: Image.network(logo),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
