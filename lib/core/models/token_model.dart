class Tokens {
  String access;
  String refresh;

  Tokens();

  Tokens.fromJson(Map<String, dynamic> json)
      : refresh = json['refresh-token'] != null
            ? json['refresh-token']
            : json['refreshToken'],
        access = json['access-token'] != null
            ? json['access-token']
            : json['accessToken'];

  Map<String, String> toJson() => {
        'access-token': access,
        'refresh-token': refresh,
      };
}
