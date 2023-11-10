class NBAModel {
  final int id;
  final String name, logo;

  NBAModel({
    required this.id,
    required this.name,
    this.logo = '',
  });

  factory NBAModel.fromJson(Map<String, dynamic> json) {
    return NBAModel(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String? ?? '',
    );
  }
}
