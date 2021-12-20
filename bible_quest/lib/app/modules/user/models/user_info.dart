import 'current_items.dart';

class UserInfo {
  String id;
  String username;
  CurrentItems currentItems;

  UserInfo({
    required this.id,
    required this.username,
    required this.currentItems,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json['id'] as String,
        username: json['username'] as String,
        currentItems: CurrentItems.fromJson(
            json['current_items'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'current_items': currentItems.toJson(),
      };

  UserInfo copyWith({
    String? id,
    String? username,
    CurrentItems? currentItems,
  }) {
    return UserInfo(
      id: id ?? this.id,
      username: username ?? this.username,
      currentItems: currentItems ?? this.currentItems,
    );
  }
}
