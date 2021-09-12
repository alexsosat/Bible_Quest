class ComplexStat {
  ComplexStat({
    required this.current,
    required this.total,
  });

  int current;
  int total;

  factory ComplexStat.fromJson(Map<String, dynamic> json) => ComplexStat(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}
