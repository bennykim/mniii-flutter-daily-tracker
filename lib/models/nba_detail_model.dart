class NBADetailModel {
  final bool allStar;
  final String code, city, nickname;

  NBADetailModel({
    required this.allStar,
    required this.code,
    required this.city,
    required this.nickname,
  });

  factory NBADetailModel.fromJson(Map<String, dynamic> json) {
    return NBADetailModel(
      allStar: json['allStar'],
      code: json['code'],
      city: json['city'],
      nickname: json['nickname'],
    );
  }
}
