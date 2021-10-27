import 'current_items.dart';

class UserInfo {
  String username;
  CurrentItems currentItems;

  UserInfo({
    required this.username,
    required this.currentItems,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        username: json['username'] as String,
        currentItems: CurrentItems.fromJson(
            json['current_items'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'current_items': currentItems.toJson(),
      };

  UserInfo copyWith({
    String? username,
    CurrentItems? currentItems,
  }) {
    return UserInfo(
      username: username ?? this.username,
      currentItems: currentItems ?? this.currentItems,
    );
  }
}
