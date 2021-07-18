class ComplexStat {
  ComplexStat({
    required this.current,
    required this.total,
  });

  double current;
  double total;

  factory ComplexStat.fromJson(Map<String, dynamic> json) => ComplexStat(
        current: json["current"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
      };
}
