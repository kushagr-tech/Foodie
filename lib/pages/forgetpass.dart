import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widget/button_widget.dart';
import '../widget/text_feild_widget.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ThemeOrange,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.deepOrange],
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
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: ThemeWhite,
                  ),
                ),
                const SizedBox(height: 32.0),
                TextFeildWidget(
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email_outlined,
                  title_text: "Enter your email", color: ThemeWhite, controller: _emailController,
                ),
                const SizedBox(height: 48.0),
                ButtonWidget(
                  title: 'Generate Password',
                  width: double.infinity,
                  onPressed: popFunction, context: context,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
