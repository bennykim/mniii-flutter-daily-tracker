import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/models/nba_detail_model.dart';
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
  late Future<NBADetailModel> nbateam;

  @override
  void initState() {
    super.initState();
    nbateam = ApiService.getTeamById(widget.id);
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
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
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
            future: nbateam,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: Column(
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
                  ),
                );
              }
              return const Text('Loading...');
            },
          )
        ],
      ),
    );
  }
}
