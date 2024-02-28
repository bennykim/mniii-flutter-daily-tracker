class NBAPlayerModel {
  final int id;
  final String firstname;
  final String lastname;
  final String affiliation;

  NBAPlayerModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.affiliation = '',
  });

  factory NBAPlayerModel.fromJson(Map<String, dynamic> json) {
    return NBAPlayerModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      affiliation: json['affiliation'] ?? '',
    );
  }
}
