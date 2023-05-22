// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foodie/constants/user_model.dart';

String title_Welcome_text = "Welcome to";
String foodie_text = "Foodie";
String rupeeSymbol = "₹";

String sf = "sf";

String baseURL = "localhost:8000";
String loginURL = "http://localhost:8000/api/signin";
String addReviewURL = "http://localhost:8000/api/updateReviewsOfRestaurant";
String createUserURL = "http://localhost:8000/api/signup";
String getAllRestaurantsURL = "http://localhost:8000/api/getAllRestaurants";
String searchRestURL = "/api/filterRestaurant";

// late User appUser;
User? appUser;

Color ThemeWhite = Colors.white;
Color ThemeBlack = Colors.black;
Color ThemeOrange = Colors.deepOrange;
Color ThemeOrangeAccent = Colors.deepOrangeAccent;

dynamic ElevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.deepOrangeAccent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
);

void popFunction(BuildContext context) {
  Navigator.pop(context);
}

void pushHomePage(BuildContext context) {
  Navigator.pushReplacementNamed(context, "Home");
}
