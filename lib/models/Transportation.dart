class Transportation {
  String? title;
  bool? isChecked;
  int? id;
  Transportation({this.title, this.isChecked, this.id});

  // Transportation.origin()
  //     : title = 'sada',
  //       isChecked = false,
  //       id = 0;

  // Transportation.fromJson(Map<String, dynamic> json) {
  //   title = json["title"];
  //   isChecked = json["isChecked"];
  //   id = json["id"];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data["title"] = title;
  //   data["isChecked"] = isChecked;
  //   data["id"] = id;
  //   return data;
  // }

  // var testMap = [
  //   {"title": "Pista", "isChecked": false, "id": 3},
  //   {"title": "lelle", "isChecked": false, "id": 3}
  // ];
  // List result = testMap.map((e) => Transportation.fromJson(e)).toList();
}
