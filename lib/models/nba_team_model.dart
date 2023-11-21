class NBATeamModel {
  final int id;
  final String name, logo;

  NBATeamModel({
    required this.id,
    required this.name,
    this.logo = '',
  });

  factory NBATeamModel.fromJson(Map<String, dynamic> json) {
    return NBATeamModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'] ?? '',
    );
  }
}
