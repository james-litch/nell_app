class Tokens {
  String access;
  String refresh;

  Tokens();

  Tokens.fromJson(Map<String, dynamic> json)
      : access = json['access-token'],
        refresh = json['refresh-token'];

  Map<String, dynamic> toJson() => {
        'access-token': access,
        'refresh-token': refresh,
      };
}
