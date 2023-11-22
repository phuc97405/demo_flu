import 'dart:convert';

import 'package:http/http.dart' as http;

class Transportation {
  String? title;
  bool? isChecked;
  int? id;
  Transportation({this.title, this.isChecked, this.id});

  Transportation.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    isChecked = json["isChecked"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["isChecked"] = isChecked;
    data["id"] = id;
    return data;
  }
}
