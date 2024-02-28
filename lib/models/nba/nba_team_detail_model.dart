class NBATeamDetailModel {
  final bool allStar;
  final String code, city, nickname;

  NBATeamDetailModel({
    required this.allStar,
    required this.code,
    required this.city,
    required this.nickname,
  });

  factory NBATeamDetailModel.fromJson(Map<String, dynamic> json) {
    return NBATeamDetailModel(
      allStar: json['allStar'],
      code: json['code'],
      city: json['city'],
      nickname: json['nickname'],
    );
  }
}
