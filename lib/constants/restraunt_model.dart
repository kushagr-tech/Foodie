import 'dart:convert';

class Restaurant {
  late String id;
  late String imageUrl;
  late String url;
  late String address;
  late String name;
  late bool onlineOrder;
  late bool bookTable;
  late double rate;
  late int votes;
  late List<String> phone;
  late String location;
  late String restType;
  late String dishLiked;
  late List<String> cuisines;
  late int cost;
  late List<String> reviews;
  late List<dynamic> tags;
  // late List<dynamic> menu_item;
  late String type;
  late String city;
  // ignore: non_constant_identifier_names
  late num mean_rating;

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? 0;
    url = json['url'] ?? '';
    imageUrl = json['Image'] ?? '';
    address = json['address'] ?? '';
    name = json['name'] ?? '';
    onlineOrder = json['online_order'] == 'TRUE';
    bookTable = json['book_table'] == 'TRUE';
    rate = double.parse(json['rate'].toString());
    votes = json['votes'] ?? 0;
    phone = json['phone'] != null
        ? List<String>.from(json['phone'].split('\n'))
        : [];

    location = json['location'] ?? '';
    restType = json['rest_type'] ?? '';
    dishLiked = json['dish_liked'] ?? '';
    tags = json['Tags'] ?? [];
    cuisines = json['cuisines'] != null
        ? List<String>.from(json['cuisines'].split(', '))
        : [];
    cost = json['cost'] ?? 0;
    reviews = json['reviews_list'] != null
        ? List<String>.from(json['reviews_list'].split('  '))
        : [];
    // menu_item = json["menu_item"];
    type = json["type"];
    city = json["city"];
    mean_rating = json["Mean Rating"] ?? 0;
  }
}

List<Restaurant> parseRestaurants(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
}
