import 'dart:convert';
import 'package:http/http.dart' as http;

class Name {
  final String first;
  final String last;

  Name({required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(first: json['first'], last: json['last']);
  }
}

class User {
  final String email;
  final String picture;
  final Name name;

  User({required this.email, required this.picture, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json["email"],
        picture: json['picture']['medium'],
        name: Name.fromJson(json['name']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = email;
    data["picture"] = picture;
    data["name"] = name;
    return data;
  }
}

class UserService {
  Future<List<User>> getUser() async {
    final res =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final List<User> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(User.fromJson(entry));
      }
      return list;
    } else {
      throw Exception('HTTP Failed to get');
    }
  }
}
