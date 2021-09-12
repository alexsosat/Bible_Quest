class CurrentReading {
  CurrentReading({
    required this.reference,
    required this.chapterProgress,
  });

  String reference;
  int chapterProgress;

  bool get hasData => (reference != "" && chapterProgress != 0);

  factory CurrentReading.fromJson(Map<String, dynamic> json) => CurrentReading(
        reference: json["reference"],
        chapterProgress: json["chapterProgress"],
      );

  Map<String, dynamic> toJson() =>
      {"reference": reference, "chapterProgress": chapterProgress};
}
