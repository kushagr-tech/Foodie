import 'package:flutter/material.dart';
import 'package:foodie/constants/constants.dart';
import 'package:foodie/constants/user_model.dart';
import 'package:foodie/core/api_client.dart';
import 'package:foodie/widget/button_widget.dart';
import 'package:foodie/widget/text_feild_widget.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeOrangeAccent, ThemeOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                Text(
                  title_Welcome_text,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: ThemeWhite,
                  ),
                ),
                Text(
                  foodie_text,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: ThemeWhite,
                  ),
                ),
                const SizedBox(height: 64.0),
                TextFeildWidget(
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  title_text: "Enter your email", color: ThemeWhite, controller: _emailController,
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _passController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline, color: ThemeWhite),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: ThemeWhite),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeWhite),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeWhite),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ThemeWhite,
                      ),
                    ),
                  ),
                  style: TextStyle(color: ThemeWhite),
                ),
                const SizedBox(height: 48.0),
                // ButtonWidget(
                //   title: 'LOGIN',
                //   width: double.infinity,
                //   onPressed: pushHomePage,
                //   context: context,
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    loginUser(_emailController.text,_passController.text);
                    Future.delayed(const Duration(milliseconds: 500), () {

                    if(appUser?.token != null && appUser?.token != ""){
                        print("Token :${appUser?.token}");
                        Navigator.pushReplacementNamed(context, "Home");
                    }else{
                            const SnackBar(content: Text('user not found'));
                    }            
                    });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: ThemeOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "ForgetPassword");
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: ThemeWhite,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Signup");
                  },
                  child: Text(
                    'New User?',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: ThemeWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
