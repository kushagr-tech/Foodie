import 'package:flutter/material.dart';
import 'package:foodie/widget/text_feild_widget.dart';

import '../constants/constants.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.text = appUser?.userDetails.username ?? "";
    _emailController = TextEditingController();
    _emailController.text = appUser?.userDetails.email ?? "";
    _phoneController = TextEditingController();
    _phoneController.text = appUser?.userDetails.phoneNo.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: ThemeOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32.0),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/burger.jpg'),
              ),
              const SizedBox(height: 32.0),
              TextFeildWidget(
                keyboardType: TextInputType.name,
                icon: Icons.person,
                title_text: "Enter the updated name",
                color: ThemeBlack, controller: _nameController,
              ),
              // TextField(
              //   controller: _nameController,
              //   decoration: InputDecoration(
              //     labelText: 'Name',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              const SizedBox(height: 16.0),
              TextFeildWidget(
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
                title_text: "Enter the updated email id",
                color: ThemeBlack, controller: _emailController,
              ),
              // TextField(
              //   controller: _emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              const SizedBox(height: 16.0),
              TextFeildWidget(
                keyboardType: TextInputType.phone,
                icon: Icons.phone,
                title_text: "Enter the updated phone number",
                color: ThemeBlack, controller: _phoneController,
              ),
              // TextField(
              //   controller: _phoneController,
              //   keyboardType: TextInputType.phone,
              //   decoration: InputDecoration(
              //     labelText: 'Phone',
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              const SizedBox(height: 32.0),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    // TODO: Implement save functionality
                    Future.delayed(const Duration(seconds: 2)).then((_) {
                      setState(() {
                        _isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated')),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
