import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String name, logo;

  const DetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          name,
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
            ],
          ),
        ],
      ),
    );
  }
}
