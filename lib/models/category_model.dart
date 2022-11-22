
import 'dart:convert';

List<String> categoryFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoryToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

//
// import 'dart:convert';
//
// List<Category>categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));
//
// String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Category {
//   Category({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.icon,
//   });
//
//   int id;
//   String  icon;
//   String image;
//   String title;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     title: json["title"],
//     image: json["image"],
//     icon: json["icon"]
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "image": image,
//     "icon" :icon,
//   };
// }
//
