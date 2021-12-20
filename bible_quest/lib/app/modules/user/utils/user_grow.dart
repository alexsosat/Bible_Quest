import 'dart:math';

class UserGrow {
  /// Returns the next total XP required after leveling up
  static int nextLevel(int level) {
    double n = 0.04 * (level ^ 3) + 0.8 * (level ^ 2) + 2 * level;
    return n.round();
  }

  ///Returns the amount of XP received per lecture
  static int getXP(int lvl) {
    double xp = sqrt(lvl) + 2;
    return xp.ceil();
  }

  /// Returns the amount of total Health after leveling up
  static int nextHealth(int lvl) {
    double n = 6 * sqrt(lvl) + 3;
    return n.ceil();
  }

  /// Returns the amount of money gained per lecture
  static double getMoney(int lvl) {
    double xp = (1.5 * sin(lvl)) + 3;
    xp = xp.floor().toDouble();
    return xp;
  }
}
