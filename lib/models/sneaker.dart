import 'dart:convert';

List<Sneaker> sneakersFromJson(String str) =>
    List<Sneaker>.from(json.decode(str).map((v) => Sneaker.fromJson(v)));

class Sneaker {
  Sneaker({
      required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.oldPrice,
      required this.sizes,
      required this.price,
      required this.description,
      required this.title,
  });

  late final String id;
  late final String name;
  late final String category;
  late final List<String> imageUrl;
  late final String oldPrice;
  late final List<dynamic> sizes;
  late final String price;
  late final String description;
  late final String title;

  Sneaker.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageUrl = List<String>.from(json["imageUrl"].map((v) => v));
    oldPrice = json['oldPrice'];
    sizes = List<dynamic>.from(json["sizes"].map((v) => v));
    price = json['price'];
    description = json['description'];
    title = json['title'];
  }
}