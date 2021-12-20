/*
{
        "level": 1,
        "streak": 0.0,
        "currency": 0.0,
        "health": {
          "current": 50.0,
          "total": 100.0,
        },
        "experience":{
          "current": 50.0,
          "total": 100.0,
        },
        
        };

*/

// To parse this JSON data, do
//
//     final userStats = userStatsFromJson(jsonString);


import 'complex_stat.dart';

class Stats {
  Stats({
    required this.level,
    required this.streak,
    required this.currency,
    required this.health,
    required this.experience,
  });

  int level;
  int streak;
  double currency;
  ComplexStat health;
  ComplexStat experience;

  get healthPercent => health.current / health.total;

  get experiencePercent => experience.current / experience.total;

  factory Stats.initialStats() => Stats(
        level: 1,
        streak: 0,
        currency: 0.0,
        health: ComplexStat(current: 9, total: 9),
        experience: ComplexStat(current: 0, total: 4),
      );

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        level: json["level"],
        streak: json["streak"],
        currency: json["currency"].toDouble(),
        health: ComplexStat.fromJson(json["health"]),
        experience: ComplexStat.fromJson(json["experience"]),
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "streak": streak,
        "currency": currency,
        "health": health.toJson(),
        "experience": experience.toJson(),
      };
}
