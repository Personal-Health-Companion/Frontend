
class User {
  final int? Id;
  final String userID;
  final String userPassword;
  final String userName;
  String location;

  User(
      {this.Id,
      required this.userID,
      required this.userPassword,
      required this.userName,
      required this.location});

  void setLocation(String newLocation) {
    location = newLocation;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'userID': userID,
      'userPassword': userPassword,
      'userName': userName,
      'location': location,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : Id = json['id'],
        userID = json['userID'],
        userPassword = json['userPassword'],
        userName = json['userName'],
        location = json['location'];
}
