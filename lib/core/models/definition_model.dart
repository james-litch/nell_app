class Definition {
  final String id;
  final String phrase;
  final String definition;

  Definition({this.id, this.phrase, this.definition});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
      id: json['id'],
      phrase: json['phrase'],
      definition: json['definition'],
    );
  }
}