class UserModel {
  String userId;
  String name;
  String fcmToken;
  String imageUrl;
  String number;

  UserModel({
    required this.userId,
    required this.name,
    required this.fcmToken,
    required this.imageUrl,
    required this.number,
  });

  factory UserModel.fromJson(Map<String, dynamic> josnData) {
    return UserModel(
      userId: josnData['userId'] as String? ?? '',
      name: josnData['name'] as String? ?? '',
      fcmToken: josnData['fcm_token'] as String? ?? '',
      imageUrl: josnData['imageUrl'] as String? ?? '',
      number: josnData['number'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'number': number,
      'fcm_token': fcmToken,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return ''' 
      userId : $userId,
      name : $name,
      number : $number,
      fcmToken:$fcmToken,
      imageUrl:$imageUrl
      ''';
  }
}
