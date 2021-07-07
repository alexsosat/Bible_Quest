class Meta {
  Meta({
    required this.fums,
    required this.fumsId,
    required this.fumsJsInclude,
    required this.fumsJs,
    required this.fumsNoScript,
  });

  String fums;
  String fumsId;
  String fumsJsInclude;
  String fumsJs;
  String fumsNoScript;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        fums: json["fums"],
        fumsId: json["fumsId"],
        fumsJsInclude: json["fumsJsInclude"],
        fumsJs: json["fumsJs"],
        fumsNoScript: json["fumsNoScript"],
      );

  Map<String, dynamic> toJson() => {
        "fums": fums,
        "fumsId": fumsId,
        "fumsJsInclude": fumsJsInclude,
        "fumsJs": fumsJs,
        "fumsNoScript": fumsNoScript,
      };
}
