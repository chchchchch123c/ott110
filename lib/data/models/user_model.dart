import 'dart:math';
import 'dart:ui';

class UserModel {
  final int userId;
  final String userName;
  final Color backgroundColor;

  UserModel(
      {required this.userName,
      required this.userId,
      required this.backgroundColor});

  factory UserModel.defaultUserModel() {
    final seed1 = DateTime.now().millisecondsSinceEpoch;
    final seed2 = DateTime.now().add(const Duration(seconds: 1)).millisecondsSinceEpoch;
    final seed3 = DateTime.now().add(const Duration(seconds: 2)).millisecondsSinceEpoch;
    return UserModel(
        userId: DateTime.now().millisecondsSinceEpoch, // userId = 중복되면 안되는 값
        userName: '',
        backgroundColor: Color.fromRGBO(Random(seed1).nextInt(256),
            Random(seed2).nextInt(256), Random(seed3).nextInt(256), 1));
  }

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      userId: json['user_id'],
      userName: json['user_name'],
      backgroundColor: Color.fromRGBO(json['background_color'][0],
          json['background_color'][1], json['background_color'][2], 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'background_color': [
        backgroundColor.red,
        backgroundColor.green,
        backgroundColor.blue
      ]
    };
  }
}
