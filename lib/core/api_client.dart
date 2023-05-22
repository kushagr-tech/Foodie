// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/constants/user_model.dart';
import 'package:http/http.dart' as http;
import '../constants/restraunt_model.dart';

Future<List<Restaurant>> fetchRestaurant() async {
  // print(getAllRestaurantsURLdio);
  final response = await http.get(Uri.parse(getAllRestaurantsURL));
  // print(response.statusCode);
  if (response.statusCode == 200) {
    return parseRestaurants(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Restaurant>> searchRestaurant(String searchItem) async {
  // print(getAllRestaurantsURLdio);
  
  final queryParameters = {
    'searchTerm': searchItem,
  };

  final response = await http.get(Uri.http(baseURL,searchRestURL,queryParameters));

  if (response.statusCode == 200) {
    print(response.body);
    return parseRestaurants(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

void createUser(String name, String email, String phone, String pass,
    BuildContext context) async {
  final response = await http.post(
    Uri.parse(createUserURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "userName": name,
      "email": email,
      "password": pass,
      "contact": phone
    }),
  );

  if (response.statusCode == 200) {
    popFunction(context);
    // return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

void addReview(BuildContext context, num rating, String id) async {
  final response = await http.put(Uri.parse(addReviewURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"rating": rating, "id": id}));
  if (response.statusCode == 200) {
    // return parseRestaurants(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Review Added')),
    );
  } else {
    throw Exception('Failed to update review');
  }
}

Future<void> loginUser(String email, String password) async {
  print(email);
  print(password);
  final response = await http.post(Uri.parse(loginURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, dynamic>{"email": email, "password": password}));

  if (response.statusCode == 200) {
    print("response body: ${response.body}");
    // print("response: ${jsonDecode(response.body)}");
    appUser = User.fromJson(jsonDecode(response.body));
  } else {
    const SnackBar(content: Text('user not found'));
    throw Exception('Failed to Login');
  }
}
