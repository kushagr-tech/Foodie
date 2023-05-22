import 'package:flutter/material.dart';
import 'package:foodie/pages/editprofile.dart';
import 'package:foodie/pages/filters_page.dart';
import 'package:foodie/pages/forgetpass.dart';
import 'package:foodie/pages/home.dart';
import 'package:foodie/pages/profile.dart';
import 'package:foodie/pages/signup.dart';
import 'package:foodie/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            initialRoute: "Home",
            routes: {
        "Home":(context) => const HomePage(),
        "Login":(context) => const Loginpage(),
        "Signup":(context) => const SignupPage(),
        "Profile":(context) => const ProfilePage(),
        "ForgetPassword":(context) => const Forgetpass(),
        "EditProfile":(context) => const EditProfilePage(),
        "Filters":(context) => const Filters(),
        // "AddReview":(context) => const AddReviewPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange ,
      ),
    );
  }
}

