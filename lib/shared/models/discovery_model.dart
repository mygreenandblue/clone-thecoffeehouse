// ignore_for_file: unnecessary_this, unused_import, unnecessary_new

import 'dart:async';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

// class Discoveries {
//   List<Discovery> items = [];

//   Discoveries();

//   Discoveries.fromJsonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     for (var item in jsonList) {
//       final pelicula = new Discovery.fromJson(item);
//       items.add(pelicula);
//     }
//   }
// }

class Discovery {
  String? id;
  String? title;
  String? imageUrl;
  dynamic date;

  Discovery({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.date,
  });

  // Discovery.fromJson(Map<dynamic, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   imageUrl = json['imageUrl'];
  //   date = json['date'];
  // }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['imageUrl'] = this.imageUrl;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['date'] = this.date;
  //   return data;
  // }
}
